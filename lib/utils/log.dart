import 'dart:io' show File, FileMode;

import 'package:logger/logger.dart';

import 'package:dart_server/config/index.dart';

class FileOutput extends LogOutput {

  late File _file;

  final _srv = container.resolve<ServerConfig>();

  @override
  void init() {
    super.init();
    _file = File('${_srv.logPath}/${_srv.logFileName}');
  }

  @override
  void output(event)  {
    for (var line in event.lines) {
      _file.writeAsStringSync("${line.toString()}\n",mode: FileMode.writeOnlyAppend);
      if(event.lines.last == line) _file.writeAsStringSync("\n",mode: FileMode.writeOnlyAppend);
    }
  }

}

class AllFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => true;
}

PrettyPrinter printer(int lineLength) => PrettyPrinter(
  methodCount: 0,
  errorMethodCount: 8,
  lineLength: lineLength,
  colors: true,
  printEmojis: true,
  printTime: true,
);

void info(dynamic message, {int lineLength = 40, int delay = 0}) {
  Logger(printer: printer(lineLength), filter: AllFilter()).i(message);
  Future.delayed(Duration(seconds: delay), () => Logger(
    output: FileOutput(),
    filter: AllFilter(),
    printer: printer(lineLength)).i(message)
  );
}

void debug(dynamic message, {int lineLength = 40, int delay = 0}) {
  Logger(printer: printer(lineLength), filter: AllFilter()).d(message);
  Future.delayed(Duration(seconds: delay), () => Logger(
    output: FileOutput(),
    filter: AllFilter(),
    printer: printer(lineLength)).d(message)
  );
}

void warning(dynamic message, {int lineLength = 40, int delay = 0}) {
  Logger(printer: printer(lineLength), filter: AllFilter()).w(message);
  Future.delayed(Duration(seconds: delay), () => Logger(
    output: FileOutput(),
    filter: AllFilter(),
    printer: printer(lineLength)).w(message)
  );
}

void error(dynamic message, {int lineLength = 40, int delay = 0}) {
  Logger(printer: printer(lineLength), filter: AllFilter()).e(message);
  Future.delayed(Duration(seconds: delay), () => Logger(
    output: FileOutput(),
    filter: AllFilter(),
    printer: printer(lineLength)).e(message)
  );
}

void wtf(dynamic message, {int lineLength = 40, int delay = 0}){
  Logger(printer: printer(lineLength), filter: AllFilter()).wtf(message);
  Future.delayed(Duration(seconds: delay), () => Logger(
    output: FileOutput(),
    filter: AllFilter(),
    printer: printer(lineLength)).wtf(message)
  );
}