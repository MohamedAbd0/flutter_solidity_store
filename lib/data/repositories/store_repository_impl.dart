import 'package:dartz/dartz.dart';
import 'package:flutter_solidity_store/export.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: StoreRepo)
class StoreRepositoryImpl implements StoreRepo {
  final SmartContractService smartContractService;
  StoreRepositoryImpl(this.smartContractService);

  @override
  Future<Either<Failure, Product>> buyProduct({
    required String productId,
  }) async {
    return Left(ServerFailure("404 Not found"));
  }

  @override
  Future<Either<Failure, Product>> fetchProductDetails({
    required String productId,
  }) async {
    try {
      Product? product;
      final List<dynamic> result =
          await smartContractService.fetctProductDetails(productId);

      if (result.isNotEmpty && (result.first as List<dynamic>).isNotEmpty) {
        List<dynamic> productsMetaData = result.first;
        final productItem = ProductModel.fromData(productsMetaData);
        product = Product(
          id: productItem.id,
          title: productItem.title,
          description: productItem.description,
          image: productItem.image,
          isSold: productItem.isSold,
          seller: productItem.seller,
          price: productItem.price,
          createdAt: productItem.createdAt,
        );

        return Right(product);
      } else {
        return Left(ServerFailure("404 Not found"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> fetchProducts() async {
    try {
      List<Product> products = [];
      final List<dynamic> result =
          await smartContractService.fetchAllProducts();

      if (result.isNotEmpty) {
        List<dynamic>? productsMetaData = result.first;
        productsMetaData?.forEach((item) {
          final product = ProductModel.fromData(item);
          products.add(Product(
            id: product.id,
            title: product.title,
            description: product.description,
            image: product.image,
            isSold: product.isSold,
            seller: product.seller,
            price: product.price,
            createdAt: product.createdAt,
          ));
        });
      }

      return Right(products);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> fetchSellerProducts({
    required String sellerAddress,
  }) async {
    try {
      List<Product> products = [];
      final List<dynamic> result =
          await smartContractService.fetchSellerProducts(sellerAddress);

      if (result.isNotEmpty) {
        List<dynamic>? productsMetaData = result.first;
        productsMetaData?.forEach((item) {
          final product = ProductModel.fromData(item);
          products.add(Product(
            id: product.id,
            title: product.title,
            description: product.description,
            image: product.image,
            isSold: product.isSold,
            seller: product.seller,
            price: product.price,
            createdAt: product.createdAt,
          ));
        });
      }

      return Right(products);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, StoreInfo>> fetchStoreInfo() async {
    try {
      final result = await smartContractService.init();

      if (result != null && result is List && result.isNotEmpty) {
        return Right(
          StoreInfo(
            title: result[0],
            cover: Utils.retriveIPFSFileUrl(result[1]),
          ),
        );
      } else {
        return Left(ServerFailure("Fail to connect blockchain network"));
      }
    } catch (e) {
      return Left(ServerFailure("Fail to connect blockchain network -> $e"));
    }
  }
}
