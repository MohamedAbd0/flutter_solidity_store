// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'store_cubit.dart';

class StoreState {
  final List<Product> products;
  final CubitStatus cubitStatus;
  final String? errorMessage;

  StoreState({
    this.products = const [],
    this.cubitStatus = CubitStatus.init,
    this.errorMessage,
  });

  StoreState copyWith({
    List<Product>? products,
    CubitStatus? cubitStatus,
    String? errorMessage,
  }) {
    return StoreState(
      products: products ?? this.products,
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
