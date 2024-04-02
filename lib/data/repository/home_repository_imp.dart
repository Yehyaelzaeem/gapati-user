import 'dart:async';
import 'package:dio/dio.dart';
import '../../domain/repository/home_repo.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base/api_response.dart';

class HomeRepositoryImp implements HomeRepository{
  final DioClient _dioClient;
  const HomeRepositoryImp({
    required DioClient dioClient,
  })  : _dioClient = dioClient;


  @override
  Future<ApiResponse> getHome() async{
    try {
      Response response = await _dioClient.get(
        AppURL.kHomeURI,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getOffers()async {
    try {
      Response response = await _dioClient.get(
        AppURL.kOffersURI,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
