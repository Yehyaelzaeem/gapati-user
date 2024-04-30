import 'dart:async';
import 'package:cogina/domain/request_body/address_body.dart';
import 'package:dio/dio.dart';
import '../../domain/repository/address_repo.dart';
import '../../domain/repository/search_repo.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base/api_response.dart';

class SearchRepositoryImp implements SearchRepository{
  final DioClient _dioClient;
  const SearchRepositoryImp({
    required DioClient dioClient,
  })  : _dioClient = dioClient;



  @override
  Future<ApiResponse> search({required String searchText})async {
    try {
      Response response = await _dioClient.get(
        AppURL.kSearchURL(searchText),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
    return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}
