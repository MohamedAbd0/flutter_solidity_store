part of 'seller_profile_cubit.dart';

class SellerProfileState {
  final List<Product> products;
  final CubitStatus cubitStatus;
  final String? errorMessage;

  SellerProfileState({
    this.products = const [],
    this.cubitStatus = CubitStatus.init,
    this.errorMessage,
  });

  SellerProfileState copyWith({
    List<Product>? products,
    CubitStatus? cubitStatus,
    String? errorMessage,
  }) {
    return SellerProfileState(
      products: products ?? this.products,
      cubitStatus: cubitStatus ?? this.cubitStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
