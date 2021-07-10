import 'package:dest/model/response_model.dart';
import 'package:dest/utils/dio_util.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:oboe/oboe.dart';

enum RequestParameterType { query, auth, headers, body, tests }
enum ResponseParamenterType { response, headers, cookies, testResults, codegen }

class ResponseController extends Oboe {
  bool _useRawBody = false;
  get useRawBody => _useRawBody;
  bool _isLoading = false;
  get isLoading => _isLoading;

  ResponseModel? _responseModel;
  ResponseModel? get responseModel => _responseModel;
  set responseModel(ResponseModel? responseModel) {
    _responseModel = responseModel;
    next();
  }

  final client = DioClient();

  // Controllers

  // Controller to handel url Input
  final urlController = TextEditingController();

  void updateRawBody(bool value) {
    _useRawBody = value;
    next();
  }

  void loading() {
    _isLoading = true;
    next();
  }

  void ready() {
    _isLoading = false;
    next();
  }

  void fetchRequest() async {
    loading();

    await client.request();
    // final stopwatch = Stopwatch()..start();
    // late var res;
    // try {
    //   // res = await dio.request(
    //   //   urlController.text,
    //   //   queryParameters: getParameterInputAsMap(ParameterInputType.query),
    //   //   data: getBody(),
    //   //   options: Options(
    //   //       method: methodDropDownController.value!['name'],
    //   //       headers: getParameterInputAsMap(ParameterInputType.header),
    //   //       responseType: ResponseType.plain),
    //   // );
    // } on DioError catch (e) {
    //   res = e.response;
    // }
    // stopwatch..stop();
    // responseModel = ResponseModel(res, stopwatch);
    ready();
  }
}

var responseController = ResponseController();
