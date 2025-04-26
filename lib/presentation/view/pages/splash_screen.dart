import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StoreCubit _storeCubitCubit;
  @override
  void initState() {
    super.initState();
    _storeCubitCubit = getIt<StoreCubit>();
    _storeCubitCubit.init();
    getIt<CryptoCurrencyPriceCubit>().getEthToAedRateStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StoreCubit, StoreState>(
        bloc: _storeCubitCubit,
        listener: (context, state) {
          if (state.cubitStatus == CubitStatus.done) {
            context.goNamed(Routes.home.name);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(
              Constant.pig_padding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Assets.animation.animationEthereumLogo.lottie(
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                ),
                state.cubitStatus == CubitStatus.error
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            state.errorMessage ?? "",
                            style: TextStyle(
                              color: Constant.RED_COLOR,
                            ),
                          ),
                          SizedBox(
                            height: Constant.normal_padding,
                          ),
                          IconButton(
                            onPressed: () {
                              _storeCubitCubit.init();
                            },
                            icon: Icon(
                              Icons.refresh_outlined,
                            ),
                          )
                        ],
                      )
                    : Text(
                        "Connecting to blockchain nodes...",
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
