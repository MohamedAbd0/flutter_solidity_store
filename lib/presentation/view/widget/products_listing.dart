import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/export.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductsListingWidget extends StatelessWidget {
  final ScrollPhysics? physics;
  final bool? shrinkWrap;
  final List<Product> products;

  const ProductsListingWidget({
    required this.products,
    super.key,
    this.physics,
    this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: shrinkWrap ?? false,
      physics: physics,
      itemCount: products.length,
      crossAxisCount: 2,
      mainAxisSpacing: Constant.medium_padding,
      crossAxisSpacing: Constant.medium_padding,
      itemBuilder: (context, index) {
        return ProductCardWidget(product: products[index]);
      },
    );
  }
}
