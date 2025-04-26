import 'package:flutter_solidity_store/export.dart';
import 'package:injectable/injectable.dart';
part 'crypto_currency_price_state.dart';

@lazySingleton
class CryptoCurrencyPriceCubit extends Cubit<CryptoCurrencyPriceState> {
  final CryptoCurrencyPriceUsecases cryptoCurrencyPriceUsecases;
  CryptoCurrencyPriceCubit(this.cryptoCurrencyPriceUsecases)
      : super(CryptoCurrencyPriceState());

  Future<void> getEthToAedRateStream() async {
    emit(state.copyWith(cubitStatus: CubitStatus.loading));
    cryptoCurrencyPriceUsecases.getEthToAedRateStream().listen((value) {
      emit(state.copyWith(
        cubitStatus: CubitStatus.done,
        amount: value,
      ));
    });
  }
}
