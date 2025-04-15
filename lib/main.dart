import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/export.dart';
import 'package:flutter_solidity_store/core/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.configure();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: Utils.messengerKey,
      routerConfig: AppRoute.router,
      title: Constant.APP_NAME,
    );
  }
}
