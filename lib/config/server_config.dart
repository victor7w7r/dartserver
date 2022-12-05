import 'dart:io' show Directory, Platform;

import 'package:fpdart/fpdart.dart' show Task;
import 'package:injectable/injectable.dart' show FactoryMethod, singleton;
import 'package:sembast/sembast.dart' show Database;
import 'package:sembast/sembast_io.dart' show databaseFactoryIo;
import 'package:system_info2/system_info2.dart' show SysInfo;
import 'package:path/path.dart' show join;

import 'package:dart_server/config/env.dart';
import 'package:dart_server/utils/index.dart';

@singleton
class ServerConfig {

  String logPath = "";
  String dbPath = "";
  String logFileName = "";
  late final Database dummyDb;

  @FactoryMethod(preResolve: true)
  static Future<ServerConfig> init() async {

    final linuxCheck = Platform.isLinux && SysInfo.userId == "0";

    final config = ServerConfig()
      ..logFileName = 'log_${timeGenerate()}.txt'
      ..logPath = linuxCheck
        ? '/server/log'
        : join(Directory.current.path, 'server','log')
      ..dbPath = linuxCheck
        ? '/server/db'
        : join(Directory.current.path, 'server','db');

    await Task(Directory(config.logPath).exists)
      .flatMap((exists) => !exists
        ? Task(() => Directory(config.logPath).create(recursive: true))
        : const Task(Future.value))
      .run();

    config.dummyDb = await databaseFactoryIo
      .openDatabase('${config.dbPath}/dummy.db', codec: sembastCodec(password: Env.bdPass));

    return config;

  }
}