import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_solidity_store/export.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StoreUsecases {
  final StoreRepo storeRepo;
  StoreUsecases(this.storeRepo);

  Future<Either<Failure, StoreInfo>> fetchStoreInfo() async {
    return await storeRepo.fetchStoreInfo();
  }

  Future<Either<Failure, List<Product>>> fetchProducts({
    int offset = 0,
    int rows = 10,
  }) async {
    return await storeRepo.fetchProducts();
  }

  Future<Either<Failure, List<Product>>> fetchSellerProducts({
    required String sellerAddress,
  }) async {
    return await storeRepo.fetchSellerProducts(sellerAddress: sellerAddress);
  }

  Future<Either<Failure, Product>> fetchProductDetails({
    required String productId,
  }) async {
    return await storeRepo.fetchProductDetails(productId: productId);
  }

  Future<Either<Failure, Product>> buyProduct({
    required String productId,
  }) async {
    return await storeRepo.buyProduct(productId: productId);
  }

  Future<Either<Failure, Product>> createProduct({
    required String title,
    required double price,
    required String description,
    required File image,
  }) async {
    return await storeRepo.createProduct(
      title: title,
      price: price,
      description: description,
      image: image,
    );
  }
}
