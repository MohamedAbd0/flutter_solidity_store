class Product {
  String id;
  String title;
  String description;
  String image;
  DateTime createdAt;
  bool isSold;
  String seller;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.isSold,
    required this.seller,
  });
}
