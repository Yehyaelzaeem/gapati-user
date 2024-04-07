import 'dart:async';
import 'package:dio/dio.dart';
import '../../domain/repository/home_repo.dart';
import '../../domain/repository/orders_repo.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base/api_response.dart';

class OrdersRepositoryImp implements OrdersRepository{
  final DioClient _dioClient;
  const OrdersRepositoryImp({
    required DioClient dioClient,
  })  : _dioClient = dioClient;


  @override
  Future<ApiResponse> getOrderDetails({required int orderId}) async{
    try {
      Response response = await _dioClient.get(
        AppURL.kOrdersURL(id: orderId),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getRestaurantOrders() async{
    try {
      Response response = await _dioClient.get(
        AppURL.kRestaurantOrdersURL,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
