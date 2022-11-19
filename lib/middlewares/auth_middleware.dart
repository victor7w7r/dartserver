import 'package:shelf_plus/shelf_plus.dart';

import 'package:dart_server/config/env.dart';
import 'package:dart_server/utils/index.dart';

Middleware auth() => (innerHandler) => (request) async {

  final apiKey = request.headers['x-api-key'];
  if((apiKey == null || apiKey != Env.key) && Env.app == "prod") {
    wtf("[401] ${request.requestedUri} 'Not Authorized", lineLength: 60);
    return Response(401, body: errorFormat("Not Authorized"), headers: {'Content-Type': 'application/json'});
  }
  return Future.sync(() => innerHandler(request)).then((response) => response);

};