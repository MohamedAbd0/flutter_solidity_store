import 'package:flutter_solidity_store/utils/utils.dart';
import 'package:web3dart/web3dart.dart';

class ProductModel {
  String id;
  String title;
  double price;
  String description;
  String image;
  DateTime createdAt;
  bool isSold;
  EthereumAddress seller;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.isSold,
    required this.seller,
  });

  factory ProductModel.fromData(List<dynamic> item) {
    /*
      struct Product {
        string uid;
        string name;
        string description;
        string image;
        bool sold;
        address payable owner;
        uint price;
        uint createdAt;
        uint soldAt;
      }
    */
    return ProductModel(
      id: item[0],
      title: item[1],
      description: item[2],
      image: Utils.retriveIPFSFileUrl(item[3]),
      isSold: item[4],
      seller: item[5],
      price: (item[6] as BigInt).toDouble(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        (item[7] as BigInt).toInt() * 1000,
      ),
    );
  }
}
