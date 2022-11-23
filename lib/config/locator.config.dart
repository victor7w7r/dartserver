// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dart_server/config/server_config.dart' as _i6;
import 'package:dart_server/controllers/dummy_controller.dart' as _i7;
import 'package:dart_server/repository/data/dummy_data.dart' as _i4;
import 'package:dart_server/repository/dummy_repository.dart' as _i3;
import 'package:dart_server/services/dummy_service.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.DummyRepository>(() => _i4.DummyData());
    gh.factory<_i5.DummyService>(
        () => _i5.DummyService(gh<_i3.DummyRepository>()));
    gh.lazySingleton<_i6.ServerConfig>(() => _i6.ServerConfig());
    gh.factory<_i7.DummyController>(
        () => _i7.DummyController(gh<_i5.DummyService>()));
    return this;
  }
}
