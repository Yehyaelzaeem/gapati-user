
import '../../data/model/base/api_response.dart';
import '../request_body/check_otp_body.dart';
import '../request_body/login_body.dart';
import '../request_body/otp_body.dart';
import '../request_body/register_body.dart';


mixin RestaurantRepository {
  Future<ApiResponse> getCategories({required int id}) ;
  Future<ApiResponse> getCategoriesItems({required int categoryId,required int storeId}) ;
  Future<ApiResponse> getItemsExtra({required int itemId}) ;

}
