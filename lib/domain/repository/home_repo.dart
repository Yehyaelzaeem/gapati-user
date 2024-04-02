
import '../../data/model/base/api_response.dart';
import '../request_body/check_otp_body.dart';
import '../request_body/login_body.dart';
import '../request_body/otp_body.dart';
import '../request_body/register_body.dart';


mixin HomeRepository {
  Future<ApiResponse> getHome() ;
  Future<ApiResponse> getOffers() ;

}
