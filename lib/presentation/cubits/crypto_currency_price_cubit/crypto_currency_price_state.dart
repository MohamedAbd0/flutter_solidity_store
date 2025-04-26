part of 'crypto_currency_price_cubit.dart';

class CryptoCurrencyPriceState {
  final double amount;
  final CubitStatus cubitStatus;
  final String? errorMessage;

  CryptoCurrencyPriceState({
    this.amount = 0,
    this.cubitStatus = CubitStatus.init,
    this.errorMessage,
  });

  CryptoCurrencyPriceState copyWith({
    double? amount,
    CubitStatus? cubitStatus,
    String? errorMessage,
  }) {
    return CryptoCurrencyPriceState(
      amount: amount ?? this.amount,
      cubitStatus: cubitStatus ?? this.cubitStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
