import 'package:dio/dio.dart';
import 'package:flutter_solidity_store/data/network/retrofit/app_interceptor.dart';
import 'package:flutter_solidity_store/export.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class AppModule {
  @lazySingleton
  AppConfig get appConfig => AppConfig(
        baseUrl: Config.apiBaseUrl,
      );
  @lazySingleton
  Dio get dio {
    final aDio = Dio(BaseOptions(baseUrl: appConfig.baseUrl));

    aDio.interceptors.add(AppInterceptor(aDio));
    aDio.interceptors.add(
      PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
      ),
    );

    return aDio;
  }
}
