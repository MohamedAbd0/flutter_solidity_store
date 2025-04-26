import 'package:flutter_solidity_store/export.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CryptoCurrencyPriceUsecases {
  final CryptoCurrencyPriceRepo cryptoCurrencyPriceRepo;
  CryptoCurrencyPriceUsecases(this.cryptoCurrencyPriceRepo);

  Stream<double> getEthToAedRateStream() async* {
    yield* cryptoCurrencyPriceRepo.getEthToAedRateStream();
  }
}
