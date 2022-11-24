import 'dart:io' show Directory, Platform;

import 'package:fpdart/fpdart.dart' show Task;
import 'package:injectable/injectable.dart' show FactoryMethod, singleton;
import 'package:sembast/sembast.dart' show Database;
import 'package:sembast/sembast_io.dart' show databaseFactoryIo;
import 'package:system_info2/system_info2.dart' show SysInfo;
import 'package:path/path.dart' as p;

import 'package:dart_server/config/env.dart';
import 'package:dart_server/utils/index.dart';

@singleton
class ServerConfig {

  String logPath = "";
  String dbPath = "";
  String logFileName = "";
  late Database dummyDb;

  @FactoryMethod(preResolve: true)
  static Future<ServerConfig> init() async {

    final config = ServerConfig();

    bool linuxCheck = Platform.isLinux && SysInfo.userId == "0";

    config.logPath = linuxCheck
      ? '/server/log'
      : p.join(Directory.current.path, 'server','log');

    config.dbPath = linuxCheck
      ? '/server/db'
      : p.join(Directory.current.path, 'server','db');

    await Task(Directory(config.logPath).exists)
      .flatMap((exists) => !exists
        ? Task(() => Directory(config.logPath).create(recursive: true))
        : const Task(Future.value))
      .run();

    config.logFileName = 'log_${timeGenerate()}.txt';

    config.dummyDb = await databaseFactoryIo
      .openDatabase('${config.dbPath}/dummy.db', codec: sembastCodec(password: Env.bdPass));

    return config;

  }
}