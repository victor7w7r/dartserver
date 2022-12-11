import 'dart:convert' show json;

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart' show injectable;

import 'package:dart_server/exceptions/index.dart';
import 'package:dart_server/repository/dummy_repository.dart';
import 'package:dart_server/models/dummy.dart';

@injectable
class DummyService {

  const DummyService(this._dummyRepository);

  final DummyRepository _dummyRepository;

  Task<String> getAll() => _dummyRepository
    .findAll()
    .map(json.encode);

  TaskEither<NotFoundException, String> getById(String id) => TaskEither.tryCatch(
    Task(_dummyRepository.findById(id).run)
      .map((res) => res.isSome()
        ? json.encode(res.getOrElse(()=>{}))
        : throw NotFoundException.dummy(id))
      .run,
    (e, _) => NotFoundException.dummy(id)
  );

  TaskEither<IDExistsOrFormatContentException, Map<String, Object?>> save(String dummy) => TaskEither.tryCatch(
    IO(() => json.decode(dummy) as Map<String, dynamic>)
      .map((map) async => validate(map)
        ? Task(_dummyRepository.saveNullCheck(map).run)
            .map((res) => res.getOrElse(() => {})
            .isEmpty
              ? map
              : throw IDExistsOrFormatContentException.idExists()
            ).run()
        : throw IDExistsOrFormatContentException.formatError())
      .run,
    (e, _) => e is FormatException
      ? IDExistsOrFormatContentException.formatError()
      : IDExistsOrFormatContentException.idExists()
  );

  TaskEither<NotFoundOrFormatContentException, Map<String, Object?>> replace(String dummy, String id) => TaskEither.tryCatch(
    IO(() => json.decode(dummy) as Map<String, dynamic>)
      .map((map) async => validate(map)
        ? Task(_dummyRepository.replace(map, id).run).map((res) => res.isSome()
            ? map
            : throw NotFoundOrFormatContentException.notFound(id)
          ).run()
        : throw NotFoundOrFormatContentException.formatError())
      .run,
    (e, _) => e is FormatException
      ? NotFoundOrFormatContentException.formatError()
      : NotFoundOrFormatContentException.notFound(id)
  );

  TaskEither<NotFoundException, String> delete(String id) => TaskEither.tryCatch(
    Task(_dummyRepository.delete(id).run)
      .map((res) => res.isNone()
        ? throw NotFoundException.dummy(id)
        : '')
      .run,
    (e, _) => NotFoundException.dummy(id)
  );

  Task<void> deleteAll() => _dummyRepository.deleteAll();

  bool validate(Map<String, dynamic> map) => Either.tryCatch(
    IO(() => Dummy.fromJson(map))
      .map((dummy) => dummy.id != "" && dummy.name != "")
      .run,
    (e, _) => e).getOrElse((_) => false);

}