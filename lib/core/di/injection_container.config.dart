// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_solidity_store/core/di/app_module.dart' as _i706;
import 'package:flutter_solidity_store/core/routes/navigation_service.dart'
    as _i1015;
import 'package:flutter_solidity_store/data/network/retrofit/app_service.dart'
    as _i315;
import 'package:flutter_solidity_store/export.dart' as _i234;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i234.AppConfig>(() => appModule.appConfig);
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i1015.NavigationService>(
        () => _i1015.NavigationService());
    gh.lazySingleton<_i315.AppService>(() => _i315.AppService(gh<_i361.Dio>()));
    return this;
  }
}

class _$AppModule extends _i706.AppModule {}
