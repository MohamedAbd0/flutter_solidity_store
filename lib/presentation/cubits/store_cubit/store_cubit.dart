import 'dart:io';

import 'package:flutter_solidity_store/export.dart';
import 'package:injectable/injectable.dart';
part 'store_state.dart';

@lazySingleton
class StoreCubit extends Cubit<StoreState> {
  final StoreUsecases storeUsecases;
  StoreCubit(this.storeUsecases) : super(StoreState());

  final List<Product> _products = [];

  Future<void> fetchProduct() async {
    emit(state.copyWith(cubitStatus: CubitStatus.loading));
    _products.clear();

    await Future.delayed(Duration(seconds: 1));

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

  Future<void> createProduct({
    required String title,
    required String description,
    required double price,
    required File image,
  }) async {
    emit(state.copyWith(cubitStatus: CubitStatus.loading));

    await Future.delayed(Duration(seconds: 1));

    final result = await storeUsecases.createProduct(
      title: title,
      price: price,
      description: description,
      image: image,
    );
    result.fold((l) {
      emit(
        state.copyWith(
          cubitStatus: CubitStatus.error,
          errorMessage: l.message,
        ),
      );
    }, (r) {
      _products.insert(0, r);
      emit(state.copyWith(
        cubitStatus: CubitStatus.done,
        products: _products,
      ));
    });
  }
}
