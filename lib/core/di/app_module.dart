import 'package:flutter_solidity_store/export.dart';
import 'package:injectable/injectable.dart';

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
}
