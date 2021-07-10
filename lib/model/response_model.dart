import 'package:dio/dio.dart';

class ResponseModel {
  final Response response;
  final Stopwatch stopwatch;

  const ResponseModel(this.response, this.stopwatch);

  /// Response body.
  dynamic get body => response.data;

  /// Response headers.
  dynamic get headers => response.headers.map;

  /// Http status code.
  int? get statusCode => response.statusCode;

  String? get statusMessage => response.statusMessage;

  dynamic contentSize() => response.data.length / 1024;
}
