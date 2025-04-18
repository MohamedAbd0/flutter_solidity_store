import 'package:flutter_solidity_store/export.dart';
import 'package:injectable/injectable.dart';
part 'product_details_cubit_state.dart';

@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final StoreUsecases storeUsecases;
  ProductDetailsCubit(this.storeUsecases) : super(ProductDetailsState());

  Future<void> fetchProductDetails(String id) async {
    emit(state.copyWith(cubitStatus: CubitStatus.loading));

    await Future.delayed(Duration(seconds: 1));
    final result = await storeUsecases.fetchProductDetails(productId: id);
    result.fold((l) {
      emit(
        state.copyWith(
          cubitStatus: CubitStatus.error,
          errorMessage: l.message,
        ),
      );
    }, (r) {
      emit(state.copyWith(
        cubitStatus: CubitStatus.init,
        product: r,
      ));
    });
  }
}
