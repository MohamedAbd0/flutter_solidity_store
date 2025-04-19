import 'package:dio/dio.dart';
import 'package:flutter_solidity_store/data/network/retrofit/app_interceptor.dart';
import 'package:flutter_solidity_store/export.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class AppModule {
  @lazySingleton
  SmartContractService get messagingService => SmartContractService();

  @lazySingleton
  AppConfig get appConfig => AppConfig(
        contractAddress: Config.CONTRACT_ADDRESS,
        contractAbi: Config.CONTRACT_ABI,
        chainId: Config.CHAIN_ID,
        rpcHttpsUrl: Config.RPC_HTTPS_URL,
        rpcSocketUrl: Config.PRC_SOCKET_URL,
        pinataApiKey: Config.PINATA_API_KEY,
        pinataApiSecretKey: Config.PINATA_API_SECRET,
        pinataGatewayUrl: Config.PINATA_GATEWAY_URL,
      );
  @lazySingleton
  Dio get dio {
    final aDio = Dio(BaseOptions(baseUrl: ""));

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
