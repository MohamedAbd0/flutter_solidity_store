// ignore_for_file: public_member_api_docs, sort_constructors_first

class AppConfig {
  /// Contract Details (SEPOLIA)
  final String contractAddress;
  final String contractAbi;

  /// Network Details (INFURA)
  final int chainId;
  final String rpcHttpsUrl;
  final String rpcSocketUrl;

  /// IPFS Deails (PINATA)
  final String pinataApiKey;
  final String pinataApiSecretKey;
  final String pinataGatewayUrl;

  AppConfig({
    required this.contractAddress,
    required this.contractAbi,
    required this.chainId,
    required this.rpcHttpsUrl,
    required this.rpcSocketUrl,
    required this.pinataApiKey,
    required this.pinataApiSecretKey,
    required this.pinataGatewayUrl,
  });
}
