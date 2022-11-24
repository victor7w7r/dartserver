import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf_plus/shelf_plus.dart';

import 'package:dart_server/router/dummy_router.dart';
import 'package:dart_server/config/index.dart';
import 'package:dart_server/utils/index.dart';

Future<Handler> initialize() async {

  if(!locator.isRegistered<ServerConfig>()) await setup();

  final app = Router(notFoundHandler: notFound).plus;

  app.use(corsHeaders(headers: {
    ACCESS_CONTROL_ALLOW_ORIGIN: '*',
    ACCESS_CONTROL_ALLOW_CREDENTIALS: 'true',
    ACCESS_CONTROL_ALLOW_METHODS: 'GET, POST, PATCH, PUT, DELETE, OPTIONS',
    ACCESS_CONTROL_ALLOW_HEADERS: 'Origin,Content-Type,Authorization,locale,x-api-key',
    ACCESS_CONTROL_MAX_AGE: '86400',
    'Content-Type': 'application/json;charset=utf-8'
  }));

  app.use(setContentType('application/json'));
  dummyRouter(app);

  return app;
}
void main(List<String> args) => shelfRun(
  initialize,
  defaultBindAddress: '0.0.0.0',
  defaultEnableHotReload: Env.app == "dev",
  onStarted: (_, port) =>
    info("Listening in port $port",
      lineLength: 40,
      delay: 1
    )
);
