import 'package:kiwi/kiwi.dart';

import 'package:dart_server/config/index.dart';

import 'package:dart_server/repository/data/dummy_data.dart';
import 'package:dart_server/repository/dummy_repository.dart';
import 'package:dart_server/controllers/dummy_controller.dart';
import 'package:dart_server/services/dummy_service.dart';

part '../generated/config/injector.g.dart';

final container = KiwiContainer();

void setup() {
  final injector = _$Injector();
  injector.configure();
}

abstract class Injector {

  @Register.singleton(ServerConfig)

  @Register.factory(DummyRepository, from: DummyData)
  @Register.factory(DummyService)
  @Register.factory(DummyController)
  void configure();

}