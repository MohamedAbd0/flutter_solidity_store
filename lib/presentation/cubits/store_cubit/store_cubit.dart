import 'package:flutter_solidity_store/export.dart';
import 'package:injectable/injectable.dart';
part 'store_state.dart';

@lazySingleton
class StoreCubit extends Cubit<StoreState> {
  final StoreUsecases storeUsecases;
  StoreCubit(this.storeUsecases) : super(StoreState());

  final List<Product> _products = [];

  Future<void> init() async {
    emit(state.copyWith(cubitStatus: CubitStatus.loading));

    final result = await storeUsecases.fetchStoreInfo();
    result.fold((l) {
      emit(
        state.copyWith(
          cubitStatus: CubitStatus.error,
          errorMessage: l.message,
        ),
      );
    }, (r) async {
      emit(state.copyWith(storeInfo: r));
      await fetchProduct();
    });
  }

  Future<void> fetchProduct() async {
    emit(state.copyWith(cubitStatus: CubitStatus.loading));
    _products.clear();

    final result = await storeUsecases.fetchProducts();
    result.fold((l) {
      emit(
        state.copyWith(
          cubitStatus: CubitStatus.error,
          errorMessage: l.message,
        ),
      );
    }, (r) {
      _products.addAll(r);
      emit(state.copyWith(
        cubitStatus: CubitStatus.done,
        products: _products,
      ));
    });
  }
}
