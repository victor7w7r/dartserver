import 'dart:convert' show json;

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart' show injectable;

import 'package:dart_server/exceptions/index.dart';
import 'package:dart_server/repository/dummy_repository.dart';
import 'package:dart_server/models/dummy.dart';

@injectable
class DummyService {

  DummyService(this._dummyRepository);

  final DummyRepository _dummyRepository;

  Task<String> getAll() => _dummyRepository
    .findAll()
    .map(json.encode);

  TaskEither<NotFoundException, String> getById(String id) => TaskEither.tryCatch(
    Task(_dummyRepository.findById(id).run)
      .map((res) => res.isSome()
        ? json.encode(res.getOrElse(()=>{}))
        : throw NotFoundException('This dummy is not found with id $id'))
      .run,
    (e, _) => NotFoundException('This dummy is not found with id $id')
  );

    TaskEither<IDExistsOrFormatContentException, Map<String, Object?>> save(String dummy) => TaskEither.tryCatch(
    IO(() => json.decode(dummy) as Map<String, dynamic>)
      .map((map) async => validate(map)
        ? Task(_dummyRepository.saveNullCheck(map).run)
            .map((res) => res.getOrElse(() => {})
            .isEmpty
              ? map
              : throw IDExistsOrFormatContentException('This id already exists', true
          )).run()
        : throw IDExistsOrFormatContentException('The format of this dummy item is incorrect or their fields are empty', false))
      .run,
    (e, _) => e as IDExistsOrFormatContentException
  );

  TaskEither<NotFoundOrFormatContentException, Map<String, Object?>> replace(String dummy, String id) => TaskEither.tryCatch(
    IO(() => json.decode(dummy) as Map<String, dynamic>)
      .map((map) async => validate(map)
        ? Task(_dummyRepository.replace(map, id).run).map((res) => res.isSome()
            ? map
            : throw NotFoundOrFormatContentException('This dummy object is not found with id $id', true
          )).run()
        : throw NotFoundOrFormatContentException('The format of this dummy item is incorrect or their fields are empty', false))
      .run,
    (e, _) => e as NotFoundOrFormatContentException
  );

  TaskEither<NotFoundException, String> delete(String id) => TaskEither.tryCatch(
    Task(_dummyRepository.delete(id).run)
      .map((res) => res.isNone()
        ? throw NotFoundException('This dummy is not found with id $id')
        : '')
      .run,
    (e, _) => NotFoundException('This dummy is not found with id $id')
  );

  Task<void> deleteAll() => _dummyRepository.deleteAll();

  bool validate(Map<String, dynamic> map) => Either.tryCatch(
    IO(() => Dummy.fromJson(map))
      .map((dummy) => dummy.id != "" && dummy.name != "")
      .run,
    (e, _) => e).getOrElse((_) => false);

}