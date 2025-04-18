part of 'product_details_cubit.dart';

class ProductDetailsState {
  final Product? product;
  final CubitStatus cubitStatus;
  final String? errorMessage;

  ProductDetailsState({
    this.product,
    this.cubitStatus = CubitStatus.init,
    this.errorMessage,
  });

  ProductDetailsState copyWith({
    Product? product,
    CubitStatus? cubitStatus,
    String? errorMessage,
  }) {
    return ProductDetailsState(
      product: product ?? this.product,
      cubitStatus: cubitStatus ?? this.cubitStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
