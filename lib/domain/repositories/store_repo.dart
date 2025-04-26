import 'package:dartz/dartz.dart';
import 'package:flutter_solidity_store/export.dart';

abstract class StoreRepo {
  Future<Either<Failure, StoreInfo>> fetchStoreInfo();

  Future<Either<Failure, List<Product>>> fetchProducts();

  Future<Either<Failure, List<Product>>> fetchSellerProducts({
    required String sellerAddress,
  });

  Future<Either<Failure, Product>> fetchProductDetails({
    required String productId,
  });

  Future<Either<Failure, Product>> buyProduct({
    required String productId,
  });
}
