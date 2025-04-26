import 'package:flutter_solidity_store/export.dart';
import 'package:injectable/injectable.dart';
import '../network/export.dart';

@Singleton(as: CryptoCurrencyPriceRepo)
class CryptoCurrencyPriceRepoImpl implements CryptoCurrencyPriceRepo {
  final PriceRateNetwork priceRateNetwork;
  CryptoCurrencyPriceRepoImpl(this.priceRateNetwork);

  @override
  Stream<double> getEthToAedRateStream() async* {
    yield* priceRateNetwork.getEthToAedRateStream();
  }
}
