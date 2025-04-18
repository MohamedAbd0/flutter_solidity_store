import 'package:avatar_plus/avatar_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/export.dart';

class SellerProfileScreen extends StatefulWidget {
  final String sellerAddress;
  const SellerProfileScreen({
    super.key,
    required this.sellerAddress,
  });

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  late SellerProfileCubit _sellerProfileCubit;
  @override
  void initState() {
    super.initState();
    _sellerProfileCubit = getIt<SellerProfileCubit>();
    _sellerProfileCubit.fetchSellerProducts(widget.sellerAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SellerProfileCubit, SellerProfileState>(
        bloc: _sellerProfileCubit,
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
            return Center(
              child: Assets.animation.animationLoading.lottie(),
            );
          } else {
            return Column(
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
                                widget.sellerAddress,
                                height: 100,
                              ),
                              SizedBox(
                                height: Constant.pig_padding,
                              ),
                              Text(widget.sellerAddress),
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
                      products: state.products,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
