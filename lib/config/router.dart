import 'package:shelf_plus/shelf_plus.dart';

import 'package:dart_server/config/index.dart';
import 'package:dart_server/controllers/dummy_controller.dart';
import 'package:dart_server/middlewares/auth_middleware.dart';
import 'package:dart_server/utils/index.dart';

Response notFound(Request req) {
  warning("[404] ${req.requestedUri} Not Found", lineLength: 60);
  return Response(404, body: errorFormat("Not Found"), headers: {
    'Content-Type': 'application/json;charset=utf-8'
  });
}

void router(RouterPlus app) {

  final dummy = locator.get<DummyController>();

  app.get('/dummy', dummy.getAllDummies, use: auth());
  app.get('/dummy/<id>', dummy.getDumymById, use: auth());
  app.post('/dummy', dummy.saveDummy, use: auth());
  app.put('/dummy/<id>', dummy.replaceDummy, use: auth());
  app.delete('/dummy/<id>', dummy.deleteDummy, use: auth());
  app.delete('/dummy', dummy.deleteAllDummies, use: auth());
}