
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../../main.dart';
import '../../../model/base/api_response.dart';

import '../../../model/base/error_response.dart';
import '../../../model/base/response_model.dart';
import 'error_widget.dart';

class ApiChecker {
  static const _tag = 'ApiChecker';

  static ResponseModel<T> checkApi<T>({bool showError=true,ApiResponse? apiResponse, dynamic message}) {
    log( 'Error Massage  $message');

    try{
      ErrorResponse errorResponse = ErrorResponse.fromJson(message);
      if (errorResponse.message != null && errorResponse.message!.isNotEmpty) {
        log( 'ErrorResponse Data  ${errorResponse.message}');
        _showAlert(errorResponse.message, showError);
        return ResponseModel<T>(false, errorResponse.message);
      } else {
        _showAlert(tr(LocaleKeys.error), showError);
        return  ResponseModel<T>(false, tr(LocaleKeys.error));
      }

    }catch(e){
      log( 'ErrorResponse = $apiResponse  && message =$message');
      if (apiResponse != null) {
        log( 'apiResponse != null  ${apiResponse.response?.data}');
        log( 'apiResponse != null  ${apiResponse.error}');
        if (apiResponse.error is ErrorResponse) {
          log( 'apiResponse is ErrorResponse');
          ErrorResponse error = apiResponse.error;
          _showAlert(error.message, showError);
          return ResponseModel<T>(false, error.message);
        } else if (apiResponse.error is ErrorModel) {
          log( 'apiResponse is ErrorModel');
          return _handleErrorErrorModel(apiResponse.error as ErrorModel);
        } else if (apiResponse.error is String) {
          log( 'apiResponse is String');
          _showAlert(apiResponse.error, showError);
          return ResponseModel<T>(false, apiResponse.error);
        } else {
          log( 'apiResponse Can not get error');
          return ResponseModel<T>(false, tr(LocaleKeys.error));
        }
      } else if (message != null) {
        log( 'Error is message');
        _showAlert(message, showError);
        return ResponseModel<T>(false, message);
      } else {
        log( 'Can not get error');
        return ResponseModel<T>(false, tr(LocaleKeys.error));
      }
    }
  }

  static ResponseModel<T> _handleErrorErrorModel<T>(ErrorModel error) {
    if (error.code == ErrorEnum.auth) {
      _onLogout();
    }
    return ResponseModel<T>(false, error.errorMessage, error: error);
  }

  static _showAlert(String? error,bool showError ) {
    // if (error != null) Alerts.showSnackBar(error);
  }
  static _onLogout() {
    if (appContext ==null) {return;}
    // Provider.of<LocalAuthProvider>(appContext!, listen: false).logOut();

  }
}
