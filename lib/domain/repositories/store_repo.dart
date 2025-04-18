import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../export.dart';

abstract class StoreRepo {
  Future<Either<Failure, StoreInfo>> fetchStoreInfo();

  Future<Either<Failure, List<Product>>> fetchProducts({
    int offset = 0,
    int rows = 10,
  });

  Future<Either<Failure, List<Product>>> fetchSellerProducts({
    required String sellerAddress,
  });

  Future<Either<Failure, Product>> fetchProductDetails({
    required String productId,
  });

  Future<Either<Failure, Product>> buyProduct({
    required String productId,
  });

  Future<Either<Failure, Product>> createProduct({
    required String title,
    required double price,
    required String description,
    required File image,
  });
}
