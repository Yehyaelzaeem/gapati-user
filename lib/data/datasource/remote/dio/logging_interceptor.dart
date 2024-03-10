import 'dart:developer';

import 'package:dio/dio.dart';


class LoggingInterceptor extends InterceptorsWrapper {
  int maxCharactersPerLine = 200;
  final _tag = 'API Request';
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    log("Request \n${options.method} : ${options.baseUrl}${options.path}  \nParameter: ${options.queryParameters}; \nEND Request");
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    log( "Response \nStatus: ${response.statusCode}\nURL: ${response.requestOptions.method} ${response.requestOptions.baseUrl}${response.requestOptions.path}");

    String responseAsString = response.data.toString();
    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
      }
    } else {
      log('Response: ${response.data}');
    }
    log("Receive END HTTP");

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    log("ERROR[${err.response?.statusCode}] \nURL: ${err.requestOptions.baseUrl}${err.requestOptions.path} \nRequest Data[${err.response?.data}]");

    return super.onError(err, handler);
  }
}


