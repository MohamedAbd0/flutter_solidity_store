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
import 'package:flutter_solidity_store/data/repositories/store_repository_impl.dart'
    as _i319;
import 'package:flutter_solidity_store/domain/usecases/store_usecases.dart'
    as _i516;
import 'package:flutter_solidity_store/export.dart' as _i234;
import 'package:flutter_solidity_store/presentation/cubits/product_details_cubit/product_details_cubit.dart'
    as _i509;
import 'package:flutter_solidity_store/presentation/cubits/seller_profile_cubit/seller_profile_cubit.dart'
    as _i830;
import 'package:flutter_solidity_store/presentation/cubits/store_cubit/store_cubit.dart'
    as _i207;
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
    gh.singleton<_i234.StoreRepo>(() => _i319.StoreRepositoryImpl());
    gh.lazySingleton<_i315.AppService>(() => _i315.AppService(gh<_i361.Dio>()));
    gh.lazySingleton<_i516.StoreUsecases>(
        () => _i516.StoreUsecases(gh<_i234.StoreRepo>()));
    gh.factory<_i509.ProductDetailsCubit>(
        () => _i509.ProductDetailsCubit(gh<_i234.StoreUsecases>()));
    gh.factory<_i830.SellerProfileCubit>(
        () => _i830.SellerProfileCubit(gh<_i234.StoreUsecases>()));
    gh.lazySingleton<_i207.StoreCubit>(
        () => _i207.StoreCubit(gh<_i234.StoreUsecases>()));
    return this;
  }
}

class _$AppModule extends _i706.AppModule {}
