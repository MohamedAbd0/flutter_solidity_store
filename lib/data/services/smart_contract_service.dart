import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_solidity_store/export.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class SmartContractService {
  /// 1- Connect to blockchain Network(https/websocktio/web3dart)
  /// 2- Connect with Smart Contract
  /// 3- Fetch Functions and Data

  Web3Client? _web3client;
  EthereumAddress? _contractAddress;
  String? _contractABI;
  DeployedContract? _deployedContract;

  AppConfig? _appConfig;

  Future<dynamic> init() async {
    _appConfig = getIt<AppConfig>();

    /// Setup blockchain Network
    _web3client = Web3Client(
      _appConfig!.rpcHttpsUrl,
      Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(_appConfig!.rpcSocketUrl)
            .cast<String>();
      },
    );

    /// Setup Smart Contract (abi, address)
    String abiFileRoot = await rootBundle.loadString(
      _appConfig!.contractAbi,
    );
    _contractABI = jsonEncode(jsonDecode(abiFileRoot)["abi"]);
    _contractAddress = EthereumAddress.fromHex(_appConfig!.contractAddress);

    /// Setup deployed Contract (abi, contract name)
    _deployedContract = DeployedContract(
      ContractAbi.fromJson(_contractABI!, "FlutterSolidityStore"),
      _contractAddress!,
    );

    return _fetchStoreInfo();
  }

  /// Fetch Store Info
  Future<dynamic> _fetchStoreInfo() async {
    List<dynamic> storeInfoData = await _web3client!.call(
      contract: _deployedContract!,
      function: _deployedContract!.function("storeInfo"),
      params: [],
    );
    return storeInfoData;
  }

  /// Fetch All Products
  Future<dynamic> fetchAllProducts() async {
    List<dynamic> product = await _web3client!.call(
      contract: _deployedContract!,
      function: _deployedContract!.function("getAllProducts"),
      params: [],
    );
    return product;
  }

  Future<dynamic> fetctProductDetails(String id) async {
    List<dynamic> product = await _web3client!.call(
      contract: _deployedContract!,
      function: _deployedContract!.function("getProduct"),
      params: [
        id,
      ],
    );
    return product;
  }

  Future<dynamic> fetchSellerProducts(String id) async {
    List<dynamic> product = await _web3client!.call(
      contract: _deployedContract!,
      function: _deployedContract!.function("getProductsByOwner"),
      params: [
        EthereumAddress.fromHex(id),
      ],
    );
    return product;
  }
}
