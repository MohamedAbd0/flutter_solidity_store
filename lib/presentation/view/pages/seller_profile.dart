import 'package:avatar_plus/avatar_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/export.dart';

class SellerProfileScreen extends StatefulWidget {
  const SellerProfileScreen({super.key});

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Constant.PRIMARY_COLOR,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: kToolbarHeight * 2,
                        ),
                        AvatarPlus(
                          "string",
                          height: 100,
                        ),
                        SizedBox(
                          height: Constant.pig_padding,
                        ),
                        Text("0x5ytyrtyrytrtrytryryyryrytry"),
                        SizedBox(
                          height: kToolbarHeight / 2,
                        ),
                      ],
                    ),
                  )),
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
          Padding(
            padding: const EdgeInsets.all(
              Constant.medium_padding,
            ),
            child: Text(
              "Products",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constant.medium_padding,
              ),
              child: ProductsListingWidget(
                products: [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
