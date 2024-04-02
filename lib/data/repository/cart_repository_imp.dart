import 'dart:async';
import 'package:cogina/domain/logger.dart';
import 'package:cogina/domain/request_body/add_item_body.dart';
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

  @override
  Future<ApiResponse> addQT({required String itemId})async {
    try {
      var data = FormData.fromMap({
        'item_id': itemId
      });
      Response response = await _dioClient.post(
        AppURL.kAddQtURL,
        data2:data
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> subQT({required String itemId}) async{
    try {
      var data = FormData.fromMap({
        'item_id': itemId
      });
      Response response = await _dioClient.post(
        AppURL.kSubQtURL,
        data2: data
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> addItem({required AddItemBody addItemBody})async {
    try {
      Response response = await _dioClient.post(
          AppURL.kAddItemURL,
          queryParameters: addItemBody.toJson()
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> deleteItem({required String itemId})async{
    try {
      var data = FormData.fromMap({
        'item_id': itemId
      });
      Response response = await _dioClient.post(
          AppURL.kDeleteItemURL,
          data2: data
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
