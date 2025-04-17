import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/export.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({super.key});

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.productDetailsScreen.name);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constant.normal_border_radius),
          color: Constant.WHITE_COLOR,
          border: Border.all(
            color: Constant.PRIMARY_COLOR.withOpacity(0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Constant.PRIMARY_COLOR.withOpacity(0.1),
              blurRadius: 8,
              blurStyle: BlurStyle.solid,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Constant.normal_border_radius),
                  topRight: Radius.circular(Constant.normal_border_radius),
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://img.freepik.com/free-vector/hand-drawn-nft-style-ape-illustration_23-2149622021.jpg",
                  placeholder: (context, url) =>
                      Assets.animation.animationEthereumLogo.lottie(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                Constant.normal_padding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Name",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    textScaler: TextScaler.linear(1.1),
                  ),
                  SizedBox(
                    height: Constant.small_padding,
                  ),
                  PriceWidget(
                    etherAmount: 98,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
