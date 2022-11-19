import 'dart:convert' show json;

import 'package:fpdart/fpdart.dart' show Task;
import 'package:shelf_plus/shelf_plus.dart';

import 'package:dart_server/services/dummy_service.dart';
import 'package:dart_server/utils/index.dart';

class DummyController {

  DummyController(this._dummyService);

  final DummyService _dummyService;

  Future<Response> getDumymById(Request req, String id) =>
    _dummyService.getById(id).match(
      (e){
        warning("GET [404] /dummy/$id, ${e.message}", lineLength: 90);
        return Response(404, body: errorFormat(e.message));
      },
      (dummy) {
        info("GET [200] /dummy/$id", lineLength: 40);
        return Response(200, body: dummy);
      }
    ).run();

  Future<Response> getAllDummies(Request req) =>
    _dummyService.getAll().map((part) {
      info("GET [200] /dummy", lineLength: 40);
      return Response(200, body: part);
    }
  ).run();

  Future<Response> saveDummy(Request req) =>
    Task(() async => req.body.asString).flatMap((body) => _dummyService.save(body).match(
      (e) {
        if(e.isId) {
          warning("POST [409] /dummy, ${e.message}", lineLength: 60);
          return Response(409, body: errorFormat(e.message));
        } else {
          warning("POST [400] /dummy, ${e.message}", lineLength: 110);
          return Response(400, body: errorFormat(e.message));
        }
      }, (_) {
        info("POST [201] /dummy", lineLength: 60);
        return Response(201, body: json.encode({"message": "Dummy is saved successfully"}));
      })
    ).run();

  Future<Response> replaceDummy(Request req, String id) =>
    Task(() async => req.body.asString).flatMap((body) => _dummyService.replace(body, id).match(
      (e) {
        if(e.notFound) {
          warning("PUT [404] /dummy/$id, ${e.message}", lineLength: 80);
          return Response(404, body: errorFormat(e.message));
        } else {
          warning("PUT [400] /dummy/$id, ${e.message}", lineLength: 80);
          return Response(400, body: errorFormat(e.message));
        }
      }, (_) {
        info("PUT [200] /dummy/$id", lineLength: 40);
        return Response(200, body: json.encode({"message": "Dummy is replaced successfully"}));
      })
    ).run();

  Future<Response> deleteDummy(Request req, String id) =>
    _dummyService.delete(id).match(
      (e) {
        warning("DELETE [404] /dummy/$id ${e.message}", lineLength: 80);
        return Response(404, body: errorFormat(e.message));
      },
      (_) {
        info("DELETE [200] /dummy/$id", lineLength: 60);
        return Response(200, body: json.encode({"message": "Dummy is deleted successfully"}));
      }
    ).run();

  Future<Response> deleteAllDummies(Request req) =>
    _dummyService.deleteAll().map((_) {
      info("DELETE [200] /dummy", lineLength: 60);
      return Response(200, body: json.encode({"message": "All dummies are deleted successfully"}));
    }).run();

}