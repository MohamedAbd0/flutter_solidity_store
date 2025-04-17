import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Assets.animation.animationEthereumLogo.lottie(
              width: MediaQuery.of(context).size.width / 2,
            ),
          ),
          Text(
            "Connecting to blockchain nodes...",
          ),
        ],
      ),
    );
  }
}
