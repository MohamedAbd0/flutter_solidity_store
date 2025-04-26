import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StoreCubit _storeCubitCubit;
  @override
  void initState() {
    super.initState();
    _storeCubitCubit = getIt<StoreCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoreState>(
      bloc: _storeCubitCubit,
      listener: (context, state) {
        if (state.cubitStatus == CubitStatus.error) {
          Utils.showErrorMessage(
            context: context,
            error: state.errorMessage ?? "",
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.storeInfo?.title ?? ""),
          ),
          body: RefreshIndicator.adaptive(
            onRefresh: () async {
              _storeCubitCubit.fetchProduct();
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.all(
                Constant.medium_padding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        Constant.normal_border_radius,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: state.storeInfo?.cover ?? "",
                        placeholder: (context, url) =>
                            Assets.animation.animationEthereumLogo.lottie(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
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
                    products: state.products,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
