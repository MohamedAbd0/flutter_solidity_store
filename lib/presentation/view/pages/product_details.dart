import 'package:avatar_plus/avatar_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/export.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductDetailsCubit _productDetailsCubit;
  @override
  void initState() {
    super.initState();
    _productDetailsCubit = getIt<ProductDetailsCubit>();
    _productDetailsCubit.fetchProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      bloc: _productDetailsCubit,
      listener: (context, state) {
        if (state.cubitStatus == CubitStatus.error) {
          Utils.showErrorMessage(
            context: context,
            error: state.errorMessage ?? "",
          );
        }
      },
      builder: (context, state) {
        if (state.cubitStatus == CubitStatus.loading) {
          return Scaffold(
            body: Center(
              child: Assets.animation.animationLoading.lottie(),
            ),
          );
        } else {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: state.product?.image ?? "",
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
                      state.product?.title ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      Utils.formatDate(
                        state.product?.createdAt ?? DateTime.now(),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: AvatarPlus(
                      state.product?.seller.hex ?? "",
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
                      context.pushNamed(
                        Routes.sellerProfileScreen.name,
                        pathParameters: {
                          'sellerAddress': state.product?.seller.hex ?? ""
                        },
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Description",
                    ),
                    subtitle: Text(
                      state.product?.description ?? "",
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
                onTap: () {},
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
                      etherAmount: state.product?.price ?? 0,
                      color: Constant.WHITE_COLOR,
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
