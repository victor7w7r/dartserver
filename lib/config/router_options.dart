import 'package:shelf_plus/shelf_plus.dart';

import 'package:dart_server/middlewares/auth_middleware.dart';

void routerOptions(RouterPlus app) {

  app.options('/dummy/<id>', () => Response.ok(null), use: auth());
  app.options('/dummy', () => Response.ok(null), use: auth());

}