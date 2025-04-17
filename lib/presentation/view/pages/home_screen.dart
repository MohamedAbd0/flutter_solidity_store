import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tala Store"),
        centerTitle: false,
        actions: [
          ElevatedButton.icon(
            onPressed: () {},
            label: Text("Wallet Connect"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add Product"),
        icon: Icon(Icons.add),
        onPressed: () {
          context.pushNamed(Routes.addProductScreen.name);
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          Constant.medium_padding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                Constant.normal_border_radius,
              ),
              child: Assets.images.imageCover.image(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constant.medium_padding,
              ),
              child: Text(
                "Newest Products",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            ProductsListingWidget(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              products: [],
            ),
          ],
        ),
      ),
    );
  }
}
