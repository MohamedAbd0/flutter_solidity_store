import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_solidity_store/export.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: StoreRepo)
class StoreRepositoryImpl implements StoreRepo {
  StoreRepositoryImpl();

  List<Product> products = [
    Product(
      id: "2wqewqdse23wqewqwdewqe",
      title: "Monkey Art",
      price: 1.091,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      image:
          "https://img.freepik.com/free-vector/hand-drawn-nft-style-ape-illustration_23-2149622021.jpg",
      isSold: false,
      seller: "1",
      createdAt: DateTime.now(),
    ),
    Product(
      id: "2wqewqdse23wqewqwewqee",
      title: "Rappit Art",
      price: 1.091,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      image: "https://cdn.open-pr.com/V/7/V721774605_g.jpg",
      isSold: false,
      seller: "1",
      createdAt: DateTime.now(),
    ),
    Product(
      id: "2wqewqdse23wqewqwwewqe",
      title: "Monkey Art",
      price: 1.091,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      image:
          "https://img.freepik.com/free-vector/hand-drawn-nft-style-ape-illustration_23-2149622021.jpg",
      isSold: false,
      seller: "1",
      createdAt: DateTime.now(),
    ),
    Product(
      id: "2wqewqdse23wqeqwqwewqe",
      title: "Monkey Art",
      price: 1.091,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      image:
          "https://img.freepik.com/free-vector/hand-drawn-nft-style-ape-illustration_23-2149622021.jpg",
      isSold: false,
      seller: "1",
      createdAt: DateTime.now(),
    ),
    Product(
      id: "2wqewqdse23wqewewdqwewqe",
      title: "Monkey Art",
      price: 1.091,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      image:
          "https://img.freepik.com/free-vector/hand-drawn-nft-style-ape-illustration_23-2149622021.jpg",
      isSold: false,
      seller: "1",
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Future<Either<Failure, Product>> buyProduct({
    required String productId,
  }) async {
    return Right(products.first);
  }

  @override
  Future<Either<Failure, Product>> createProduct({
    required String title,
    required double price,
    required String description,
    required File image,
  }) async {
    return Right(Product(
      id: "id",
      title: title,
      price: price,
      description: description,
      image:
          "https://img.freepik.com/free-vector/hand-drawn-nft-style-ape-illustration_23-2149622021.jpg",
      createdAt: DateTime.now(),
      isSold: false,
      seller: "1",
    ));
  }

  @override
  Future<Either<Failure, Product>> fetchProductDetails({
    required String productId,
  }) async {
    return Right(products.firstWhere((item) => item.id == productId));
  }

  @override
  Future<Either<Failure, List<Product>>> fetchProducts({
    int offset = 0,
    int rows = 10,
  }) async {
    return Right(products);
  }

  @override
  Future<Either<Failure, List<Product>>> fetchSellerProducts({
    required String sellerAddress,
  }) async {
    return Right(products);
  }

  @override
  Future<Either<Failure, StoreInfo>> fetchStoreInfo() async {
    return Right(
      StoreInfo(
        title: "Tala Store",
        cover:
            "https://img.freepik.com/free-vector/hand-drawn-nft-style-ape-illustration_23-2149622021.jpg",
      ),
    );
  }
}
