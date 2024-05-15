import '../../data/model/base/api_response.dart';
import '../request_body/address_body.dart';
mixin AddressRepository {
  Future<ApiResponse> getMainAddress() ;
  Future<ApiResponse> getLastAddress() ;
  ///New
  Future<ApiResponse> addAddress({required AddressBody addressBody}) ;
  Future<ApiResponse> getAllAddress() ;
  Future<ApiResponse> updateAddress({required AddressBody addressBody,required int addressId}) ;
  Future<ApiResponse> deleteAddress({required int addressId}) ;
}
