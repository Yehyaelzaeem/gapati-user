
import '../../data/model/base/api_response.dart';
import '../request_body/check_otp_body.dart';
import '../request_body/login_body.dart';
import '../request_body/otp_body.dart';
import '../request_body/rate_body.dart';
import '../request_body/register_body.dart';


mixin OrdersRepository {
  Future<ApiResponse> rateOrder({required RateBody rateBody}) ;
  Future<ApiResponse> getRestaurantOrders() ;
  Future<ApiResponse> getOrderDetails({required int orderId}) ;

}
