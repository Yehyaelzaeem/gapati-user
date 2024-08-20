import 'dart:async';
import 'package:dio/dio.dart';
import '../../domain/repository/check_out_repo.dart';
import '../../domain/repository/favorite_repo.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base/api_response.dart';

class FavoriteRepositoryImp implements FavoriteRepository{
  final DioClient _dioClient;
  const FavoriteRepositoryImp({
    required DioClient dioClient,
  })  : _dioClient = dioClient;

  @override
  Future<ApiResponse> getFavorite() async{
    try {
      Response response = await _dioClient.get(
          AppURL.kGetFavoriteURL,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> addFavorite({required int itemId}) async{
    try {
      Response response = await _dioClient.post(
          AppURL.kAddFavoriteURL,
          queryParameters: {
            'item_id':itemId.toString()
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }



  @override
  Future<ApiResponse> removeFavorite({required int itemId})async {
    try {
      Response response = await _dioClient.post(
          AppURL.kRemoveFavoriteURL,
          queryParameters: {
            'item_id':itemId.toString()
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> addFavoriteRestaurant({required int restaurantId}) async{
    try {
      Response response = await _dioClient.post(
          AppURL.kAddFavoriteRestaurantURL,
          queryParameters: {
            'restaurant_id':restaurantId.toString()
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getFavoriteRestaurant() async{
    try {
      Response response = await _dioClient.get(
        AppURL.kGetFavoriteRestaurantURL,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> removeFavoriteRestaurant({required int restaurantId}) async{
    try {
      Response response = await _dioClient.post(
          AppURL.kRemoveFavoriteRestaurantURL,
          queryParameters: {
            'restaurant_id':restaurantId.toString()
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
