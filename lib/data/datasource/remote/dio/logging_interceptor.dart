import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/navigation_services.dart';


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
    // AwesomeDialog(
    //     context: NavigationService.navigationKey.currentContext!,
    //     dialogBackgroundColor: AppColors.whiteColor,
    //     animType: AnimType.bottomSlide,
    //     // headerAnimationLoop: false,
    //     // autoHide: const Duration(seconds: 5),
    //      onDismissCallback:(t)=> {},
    //     // dismissOnTouchOutside: false,
    //     btnOkText: 'Back',
    //     btnOkOnPress: (){},
    //     btnOkColor:AppColors.primaryColor,
    //     dialogType: DialogType.error,
    //     // dismissOnBackKeyPress: false,
    //     // useRootNavigator: true,
    //     body: Padding(
    //       padding: const EdgeInsets.all(25.0),
    //       child: Text("${err.response?.data['message']}",
    //       style: TextStyles.font20Black700Weight,
    //       ),
    //     ))
    //     .show();
    return super.onError(err, handler);
  }
}


