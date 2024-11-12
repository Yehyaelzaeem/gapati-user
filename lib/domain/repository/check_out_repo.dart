
import '../../data/model/base/api_response.dart';
import '../../data/model/response/delivery_fees_params.dart';
import '../request_body/add_item_body.dart';
import '../request_body/address_body.dart';
import '../request_body/check_otp_body.dart';
import '../request_body/check_out_body.dart';
import '../request_body/login_body.dart';
import '../request_body/otp_body.dart';
import '../request_body/register_body.dart';


mixin CheckOutRepository {

  Future<ApiResponse> checkOut({required CheckOutModel checkOutBody}) ;
  Future<ApiResponse> getDeliveryFees({required DeliveryFeesParams params});

}
