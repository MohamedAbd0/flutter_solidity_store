import 'package:avatar_plus/avatar_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/export.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "https://img.freepik.com/free-vector/hand-drawn-nft-style-ape-illustration_23-2149622021.jpg",
                  placeholder: (context, url) =>
                      Assets.animation.animationEthereumLogo.lottie(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: kToolbarHeight,
                    left: Constant.medium_padding,
                  ),
                  child: CircleAvatar(
                    child: BackButton(),
                  ),
                )
              ],
            ),
            ListTile(
              title: Text(
                "Title Prod",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                "Posted at 12 mar 2044 12:04 pm",
              ),
            ),
            ListTile(
              leading: AvatarPlus(
                "jonny",
                width: 45,
              ),
              title: Text(
                "Saller",
              ),
              subtitle: Text(
                "0x5edte54e4e5e45e54e5sseeweqwewqeq",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                context.pushNamed(Routes.sellerProfileScreen.name);
              },
            ),
            ListTile(
              title: Text(
                "Description",
              ),
              subtitle: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(
          Constant.pig_padding,
        ),
        child: MyBotton(
          onTap: () {
            print("object");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Buy Now",
                textScaler: TextScaler.linear(1.1),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Constant.WHITE_COLOR,
                ),
              ),
              PriceWidget(
                etherAmount: 98,
                color: Constant.WHITE_COLOR,
              )
            ],
          ),
        ),
      ),
    );
  }
}
