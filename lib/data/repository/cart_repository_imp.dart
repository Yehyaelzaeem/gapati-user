import 'dart:async';
import 'package:dio/dio.dart';
import '../../domain/repository/cart_repo.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base/api_response.dart';

class CartRepositoryImp implements CartRepository{
  final DioClient _dioClient;
  const CartRepositoryImp({
    required DioClient dioClient,
  })  : _dioClient = dioClient;


  @override
  Future<ApiResponse> getCart() async{
    try {
      Response response = await _dioClient.post(
        AppURL.kGetCartURL,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
