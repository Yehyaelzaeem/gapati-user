
import '../../data/model/base/api_response.dart';
import '../request_body/add_item_body.dart';
import '../request_body/address_body.dart';
import '../request_body/check_otp_body.dart';
import '../request_body/check_out_body.dart';
import '../request_body/login_body.dart';
import '../request_body/otp_body.dart';
import '../request_body/register_body.dart';


mixin FavoriteRepository {

  Future<ApiResponse> getFavorite();
  Future<ApiResponse> addFavorite({required int itemId});
  Future<ApiResponse> removeFavorite({required int itemId});


  Future<ApiResponse> getFavoriteRestaurant() ;
  Future<ApiResponse> addFavoriteRestaurant({required int restaurantId}) ;
  Future<ApiResponse> removeFavoriteRestaurant({required int restaurantId}) ;
}
