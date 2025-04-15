import 'package:flutter_solidity_store/core/di/injection_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;

@injectableInit
Future<GetIt> configure() async {
  return getIt.init();
}
