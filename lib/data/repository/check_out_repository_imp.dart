import 'dart:async';
import 'dart:convert';
import 'package:delivego/data/model/response/delivery_fees_params.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import '../../domain/repository/check_out_repo.dart';
import '../../domain/request_body/check_out_body.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base/api_response.dart';

class CheckOutRepositoryImp implements CheckOutRepository{
  final DioClient _dioClient;
  const CheckOutRepositoryImp({
    required DioClient dioClient,
  })  : _dioClient = dioClient;

  @override
  Future<ApiResponse> checkOut({required CheckOutModel checkOutBody}) async{
    try {
      Response response = await _dioClient.post(
          AppURL.kCheckOutURL,
          queryParameters: checkOutBody.toJson()
      );
      /*
      Response response = await _dioClient.request(
          AppURL.kCheckOutURL,
          method: 'POST',
          data: checkOutBody.toJson()
      );
       */
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getDeliveryFees({required DeliveryFeesParams params}) async{
    try {
      Response response = await _dioClient.post(
          AppURL.kGetDeliveryFees,
          queryParameters: params.toMap()
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getNearestBranch({required LatLng latLng}) async{
    try {
      Response response = await _dioClient.get(
          AppURL.kGetNearestBranchURL(latLng),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
