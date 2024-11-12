import 'dart:async';
import 'package:delivego/data/model/response/accept_prescriptoin_params.dart';
import 'package:delivego/data/model/response/prescription_params.dart';
import 'package:delivego/domain/logger.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../domain/repository/home_repo.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base/api_response.dart';
import '../model/response/home_params.dart';

class HomeRepositoryImp implements HomeRepository{
  final DioClient _dioClient;
  const HomeRepositoryImp({
    required DioClient dioClient,
  })  : _dioClient = dioClient;


  @override
  Future<ApiResponse> getHome({required HomeParams params}) async{
    try {
      Response response = await _dioClient.get(
        AppURL.kHomeURI(params),
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

  @override
  Future<ApiResponse> getRestaurantsNearest(HomeParams params)async {
    try {
      Response response = await _dioClient.get(
        AppURL.kRestaurantsNearest(params),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getBanner()async {
    try {
      Response response = await _dioClient.get(
        AppURL.kBannersURI,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getStoreTypes()async {
    try {
      Response response = await _dioClient.get(
        AppURL.kStoreTypesURI,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getStores({required HomeParams params}) async {
    try {
      Response response = await _dioClient.get(
        AppURL.kStoresURI(params),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> sendPrescription({required PrescriptionParams params}) async{
    try {
      FormData formData =FormData.fromMap({
        "prescription": await MultipartFile.fromFile(params.prescription!.path!, filename: 'fileName'),
        "note": params.note,
        "store_id": params.storeId,
        "address_id": params.addressId,
        "branch_id": params.brandId,
      });
      Response response = await _dioClient.post(
        AppURL.kSendPrescriptionURL,
       data2: formData
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getPrescriptions() async{
    try {

      Response response = await _dioClient.get(
          AppURL.kGetPrescriptionUrl,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> acceptPrescription({required AcceptPrescriptionParams params}) async {
    try {

      Response response = await _dioClient.post(
        AppURL.kAcceptPrescriptionUrl(params.id??0),
        data2: FormData.fromMap({
          "payment_method": params.paymentMethod,
        }),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
