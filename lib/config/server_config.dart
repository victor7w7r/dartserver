import 'dart:io' show Directory, Platform;

import 'package:fpdart/fpdart.dart' show Task;
import 'package:injectable/injectable.dart' show lazySingleton;
import 'package:sembast/sembast.dart' show Database;
import 'package:sembast/sembast_io.dart' show databaseFactoryIo;
import 'package:system_info2/system_info2.dart' show SysInfo;
import 'package:path/path.dart' as p;

import 'package:dart_server/config/env.dart';
import 'package:dart_server/utils/index.dart';

@lazySingleton
class ServerConfig {

  String logPath = Platform.isLinux && SysInfo.userId == "0"
    ? '/server/log'
    : p.join(Directory.current.path, 'server','log');

  String dbPath = Platform.isLinux && SysInfo.userId == "0"
    ? '/server/db'
    : p.join(Directory.current.path, 'server','db');

  late String logFileName;

  late Database dummyDb;

  Future<void> init() async {

    await Task(Directory(logPath).exists)
      .flatMap((exists) => !exists
        ? Task(() => Directory(logPath).create(recursive: true))
        : const Task(Future.value))
      .run();

    logFileName = 'log_${timeGenerate()}.txt';

    dummyDb = await databaseFactoryIo
      .openDatabase('$dbPath/dummy.db', codec: sembastCodec(password: Env.bdPass));

  }
}