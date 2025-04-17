import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/export.dart';
import 'package:flutter_solidity_store/presentation/view/pages/home_screen.dart';

enum Routes {
  splashScreen("/splashscreen"),
  home("/home"),
  productDetailsScreen("/productDetailsScreen"),
  sellerProfileScreen("/sellerProfileScreen"),
  addProductScreen("/addProductScreen");

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.home.path,
    navigatorKey: getIt<NavigationService>().navigatorKey,
    errorBuilder: (context, state) {
      router.goNamed(Routes.splashScreen.name);
      return Container();
    },
    routes: [
      GoRoute(
        path: Routes.splashScreen.path,
        name: Routes.splashScreen.name,
        builder: (_, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        builder: (_, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: Routes.productDetailsScreen.path,
        name: Routes.productDetailsScreen.name,
        builder: (_, state) {
          return const ProductDetailsScreen();
        },
      ),
      GoRoute(
        path: Routes.sellerProfileScreen.path,
        name: Routes.sellerProfileScreen.name,
        builder: (_, state) {
          return const SellerProfileScreen();
        },
      ),
      GoRoute(
        path: Routes.addProductScreen.path,
        name: Routes.addProductScreen.name,
        builder: (_, state) {
          return const AddProductScreen();
        },
      ),
    ],
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
  );
}
