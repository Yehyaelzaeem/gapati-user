import 'dart:async';
import 'package:dio/dio.dart';
import '../../domain/repository/restaurant_repo.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base/api_response.dart';

class RestaurantRepositoryImp implements RestaurantRepository{
  final DioClient _dioClient;
  const RestaurantRepositoryImp({
    required DioClient dioClient,
  })  : _dioClient = dioClient;


  @override
  Future<ApiResponse> getCategories({required int id})async {
    try {
      Response response = await _dioClient.get(
        AppURL.kCategoriesURI(id),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getCategoriesItems({required int categoryId, required int storeId})async {
    try {
      Response response = await _dioClient.get(
        AppURL.kCategoriesItemsURI(categoryId: categoryId, storeId: storeId)
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getItemsExtra({required int itemId})async {
    try {
      Response response = await _dioClient.get(
          AppURL.kItemExtraURI(itemId)
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
