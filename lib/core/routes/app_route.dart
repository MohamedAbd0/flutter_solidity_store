import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/export.dart';

enum Routes {
  splashScreen("/splashscreen"),

  /// Home Page
  home("/home"),

  /// authentication
  login('/authentication/login');

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splashScreen.path,
    navigatorKey: getIt<NavigationService>().navigatorKey,
    errorBuilder: (context, state) {
      router.goNamed(Routes.home.name);
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
    ],
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
  );
}
