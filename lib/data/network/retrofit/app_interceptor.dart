import 'package:dio/dio.dart';

class AppInterceptor extends QueuedInterceptor {
  final Dio dio;
  late Map<String, String> headers;

  AppInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await _updateHeaders();
    options.headers.addAll(headers);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  Future<void> _updateHeaders() async {
    headers = {
      'content-type': 'application/json',
    };
  }
}
