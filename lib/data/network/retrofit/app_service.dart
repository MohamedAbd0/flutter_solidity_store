import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'app_service.g.dart';

@RestApi()
@LazySingleton()
abstract class AppService {
  @factoryMethod
  factory AppService(Dio dio) = _AppService;
}
