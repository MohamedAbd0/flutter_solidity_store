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
    _storeCubitCubit.fetchProduct();
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
              BlocConsumer<StoreCubit, StoreState>(
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
                  if (state.cubitStatus == CubitStatus.loading) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width / 2,
                      ),
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  } else {
                    return ProductsListingWidget(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      products: state.products,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
