// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../config/injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => ServerConfig())
      ..registerFactory<DummyRepository>((c) => DummyData())
      ..registerFactory((c) => DummyService(c<DummyRepository>()))
      ..registerFactory((c) => DummyController(c<DummyService>()));
  }
}
