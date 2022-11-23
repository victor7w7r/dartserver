import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart' show Injectable;
import 'package:sembast/sembast.dart';

import 'package:dart_server/config/index.dart';
import 'package:dart_server/repository/dummy_repository.dart';

@Injectable(as: DummyRepository)
class DummyData implements DummyRepository {

  final _store = stringMapStoreFactory.store('dummy');
  final _db = locator.get<ServerConfig>().dummyDb;

  @override
  findAll() => Task(() => _store.find(_db))
    .map((lsn) => lsn.map((sn) => sn.value)
    .toList());

  @override
  findById(id) => TaskOption(() async =>
    Option.fromNullable(await _store.record(id).get(_db))
  );

  @override
  saveNullCheck(part) => findById(part['id']).orElse(() =>
    TaskOption(() async => Option.fromNullable(
      await _store.record(part['id']).put(_db, part)
    ).map((t) => {}))
  );

  @override
  replace(part, id) => findById(id).andThen(() =>
    TaskOption(() async => Option.fromNullable(
      await _store.record(id).put(_db, part)
    ))
  );


  @override
  delete(id) => findById(id).andThen(() =>
    TaskOption(() async => Option.fromNullable(
      await _store.record(id).delete(_db)
    ))
  );

  @override
  deleteAll() => Task(() async => _store.delete(_db));

}