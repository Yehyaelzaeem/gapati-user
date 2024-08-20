import 'dart:async';
import 'package:dio/dio.dart';
import '../../domain/repository/check_out_repo.dart';
import '../../domain/repository/more_repo.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base/api_response.dart';

class MoreRepositoryImp implements MoreRepository{
  final DioClient _dioClient;
  const MoreRepositoryImp({
    required DioClient dioClient,
  })  : _dioClient = dioClient;


  @override
  Future<ApiResponse> getAboutUs() async{
    try {
      Response response = await _dioClient.get(
          AppURL.kGetAboutUsURL,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getPrivacy() async{
    try {
      Response response = await _dioClient.get(
        AppURL.kGetPrivacyURL,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getTerms() async{
    try {
      Response response = await _dioClient.get(
        AppURL.kGetTermsURL,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
