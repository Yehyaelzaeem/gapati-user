
import '../../data/model/base/api_response.dart';
import '../request_body/add_item_body.dart';
import '../request_body/check_otp_body.dart';
import '../request_body/login_body.dart';
import '../request_body/otp_body.dart';
import '../request_body/register_body.dart';


mixin CartRepository {
  Future<ApiResponse> getCart() ;
  Future<ApiResponse> addQT({required String itemId}) ;
  Future<ApiResponse> subQT({required String itemId}) ;
  Future<ApiResponse> addItem({required AddItemBody addItemBody}) ;
  Future<ApiResponse> deleteItem({required String itemId}) ;
}
