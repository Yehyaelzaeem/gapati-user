import 'dart:async';
import 'package:cogina/domain/request_body/address_body.dart';
import 'package:dio/dio.dart';
import '../../domain/repository/address_repo.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base/api_response.dart';

class AddressRepositoryImp implements AddressRepository{
  final DioClient _dioClient;
  const AddressRepositoryImp({
    required DioClient dioClient,
  })  : _dioClient = dioClient;


  @override
  Future<ApiResponse> getMainAddress() async{
    try {
      Response response = await _dioClient.get(
        AppURL.kGetMainAddressURL,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> addAddress({required AddressBody addressBody})async {
    try {
      Response response = await _dioClient.post(
        AppURL.kAddAddressURL,
        queryParameters: addressBody.toJson()
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getAllAddress()async {
    try {
      Response response = await _dioClient.get(
        AppURL.kGetAllAddressURL,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getLastAddress() async{
    try {
      Response response = await _dioClient.get(
        AppURL.kGetLastAddressURL,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> deleteAddress({required int addressId}) async{
    try {
      Response response = await _dioClient.post(
        AppURL.kDeleteAddressURL(addressId),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> updateAddress({required AddressBody addressBody, required int addressId})async{
    try {
      Response response = await _dioClient.post(
        AppURL.kUpdateAddressURL(addressId),
          queryParameters: addressBody.toJson()
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}
