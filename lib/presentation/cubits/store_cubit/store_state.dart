// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'store_cubit.dart';

class StoreState {
  final List<Product> products;
  final StoreInfo? storeInfo;
  final CubitStatus cubitStatus;
  final String? errorMessage;

  StoreState({
    this.products = const [],
    this.storeInfo,
    this.cubitStatus = CubitStatus.init,
    this.errorMessage,
  });

  StoreState copyWith({
    List<Product>? products,
    StoreInfo? storeInfo,
    CubitStatus? cubitStatus,
    String? errorMessage,
  }) {
    return StoreState(
      products: products ?? this.products,
      storeInfo: storeInfo ?? this.storeInfo,
      cubitStatus: cubitStatus ?? this.cubitStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum CubitStatus {
  init,
  loading,
  done,
  error,
}
