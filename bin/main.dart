import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf_plus/shelf_plus.dart';

import 'package:dart_server/config/env.dart';

Future<Handler> initialize() async {

  final app = Router().plus
    ..use(corsHeaders(headers: {
    ACCESS_CONTROL_ALLOW_ORIGIN: '*',
    ACCESS_CONTROL_ALLOW_CREDENTIALS: 'true',
    ACCESS_CONTROL_ALLOW_METHODS: 'GET, POST, PATCH, PUT, DELETE, OPTIONS',
    ACCESS_CONTROL_ALLOW_HEADERS: 'Origin,Content-Type,Authorization,locale,x-api-key',
    ACCESS_CONTROL_MAX_AGE: '86400',
    'Content-Type': 'application/json;charset=utf-8'
  }))
    ..use(setContentType('application/json'));

  return app;
}
Future<void> main(List<String> args) async {

  shelfRun(
    initialize,
    defaultBindAddress: '0.0.0.0',
    defaultEnableHotReload: Env.app == "dev",
    onStarted: (_, port) => print("Listening in port $port")
  );

}