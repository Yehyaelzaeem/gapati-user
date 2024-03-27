import 'dart:async';
import 'dart:io';
import 'package:cogina/domain/request_body/profile_body.dart';
import 'package:dio/dio.dart';
import '../../domain/logger.dart';
import '../../domain/repository/profile_repo.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base/api_response.dart';

class ProfileRepositoryImp implements ProfileRepository{
  final DioClient _dioClient;
  const ProfileRepositoryImp({
    required DioClient dioClient,
  })  : _dioClient = dioClient;

  @override
  Future<ApiResponse> profile()async {
    try {
      Response response = await _dioClient.get(
        AppURL.kGetProfileURL,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> updateProfile({required ProfileBody profileBody}) async{
    try {
      Response response = await _dioClient.post(
        AppURL.kUpdateProfileURL,
        queryParameters: profileBody.toJson()
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> updateImageProfile({required File image}) async{
    log('rrrrrrrrrrrrrrrrrr','response.toString()');
    var data = FormData.fromMap({
      'image': [
        await MultipartFile.fromFile(image.path, filename: 'upload')
      ],

    });
    try {
      Response response = await _dioClient.post(
          AppURL.kUpdateImageProfileURL,
          data2: data,
      );
      log('rrrrrrrrrrrrrrrrrr',response.toString());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
