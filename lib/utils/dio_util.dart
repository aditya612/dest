import 'dart:async';

import '../controller/response_controller.dart';
import '../model/response_model.dart';
import 'package:dio/dio.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}

class DioClient {
  final Dio _client;
  DioClient() : _client = Dio()..interceptors.add(Logging());
  // Dio get dio => Dio()..interceptors.add(Logging());
  Dio get client => _client;

  FutureOr<void> request() async {
    final _stopwatch = Stopwatch()..start();
    late var res;
    try {
      res = await _client.request(
        responseController.urlController.text,
        // queryParameters:
        //     responseController.getParameterInputAsMap(ParameterInputType.query),
        // data: responseController.getBody(),
        // options: Options(
        //     method: responseController.methodDropDownController.value!['name'],
        //     headers: responseController
        //         .getParameterInputAsMap(ParameterInputType.header),
        //     responseType: ResponseType.plain),
      );
    } on DioError catch (e) {
      res = e.response;
    }
    _stopwatch..stop();
    responseController.responseModel = ResponseModel(res, _stopwatch);
  }
}
