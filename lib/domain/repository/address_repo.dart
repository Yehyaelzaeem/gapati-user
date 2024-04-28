import '../../data/model/base/api_response.dart';
import '../request_body/address_body.dart';
mixin AddressRepository {
  Future<ApiResponse> getMainAddress() ;
  Future<ApiResponse> getLastAddress() ;
  Future<ApiResponse> addMainAddress({required AddressBody addressBody}) ;
  Future<ApiResponse> getAllAddress() ;
}
