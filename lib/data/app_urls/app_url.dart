import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../main.dart';
import '../model/response/home_params.dart';

class AppURL {

  static const String kAPIKey = "";
  static  String kBaseURL = "https://one-chapati.com/api/";
  static const String kApiGoogleMap = "AIzaSyCcLzjD-Xxomlnw7ALIFCNzp4pQzoAp64Y";

  ///Auth
  static const String kLoginURI = "auth/login";
  static const String kOtpURI = "auth/login";
  static const String kRegisterURI = "auth/register";
  static const String kLogoutURI = "auth/logout";

  static const String kForgetPasswordURI = "auth/password-otp";
  static const String kCheckOTPURI = "auth/check-otp";
  static const String kResetPasswordURI = "auth/change-password";
  static const String kDeleteAccountURI = "";
  static const String kUpdateFCMTokenURI = "fcm_token";

  ///home
  static  String kHomeURI (HomeParams params)=>  "home?lat=${params.latLng?.latitude}&lng=${params.latLng?.longitude}&store_type_id=${params.storeId}";
  static  String kStoresURI (HomeParams params)=>  "stores/nearestStores?lat=${params.latLng?.latitude}&lng=${params.latLng?.longitude}&store_type_id=${params.storeId}";
  static const String kOffersURI = "stores/offers";
  static const String kCategoriesHomeURI = "stores/all-categories";
  static const String kBannersURI = "banner";
  static  String kRestaurantsNearest (HomeParams params)=> "home?lat=${params.latLng?.latitude}&lng=${params.latLng?.longitude}&store_type_id=${params.storeId}";
  static  String kCategoriesURI (int id)=> "stores/all-categories?store_id=$id";
  static  String kItemExtraURI (int id)=> "stores/items/single?item_id=$id";
  static  String kBestDishURI = "stores/items/best_dishes";
  static  String kSearchItemURI ({required String searchText})=> "stores/items/search?search=$searchText";
  static  String kCategoriesItemsURI ({required int categoryId,required int storeId})=> "stores/categories?category_id=$categoryId&store_id=$storeId";
  static const String kSendPrescriptionURL = "stores/checkout/send-prescription";
  static const String kGetPrescriptionUrl = "stores/checkout/prescription";
  static  String kAcceptPrescriptionUrl(int id) => "stores/checkout/accept-prescription/$id";

  ///Payment
  static String  paymentUrl (int orderId)=> 'https://one-chapati.com/online-payment/$orderId';

  ///Cart
  static const String kGetCartURL = "shopping-cart";
  static const String kAddQtURL = "shopping-cart/add";
  static const String kSubQtURL = "shopping-cart/sub";
  static const String kAddItemURL = "shopping-cart/insert";
  static const String kUpdateItemURL = "shopping-cart/update";
  static const String kDeleteItemURL = "shopping-cart/delete";
  static const String kGetMainAddressURL = "other-trip/get-main-address";
  static const String kGetLastAddressURL = "last-address";


  ///Address
  static const String kAddAddressURL = "address/add";
  static const String kGetAllAddressURL = "address/list";
  static  String kDeleteAddressURL(int id)=> "address/delete/$id";
  static  String kUpdateAddressURL(int id)=> "address/update/$id";

  ///checkout
  static const String kCheckOutURL = "stores/checkout/store";
  static const String kGetDeliveryFees = "stores/checkout/delivery_fees";
  static  String kGetNearestBranchURL(LatLng latLng) => "stores/nearestStores?lat=${latLng.latitude}&lng=${latLng.longitude}";
  ///Search
  static  String kSearchURL(String searchText) => "stores/search?search=$searchText";
  ///more
  static const String kGetProfileURL = "profile";
  static const String kUpdateProfileURL = "profile/update";
  static const String kUpdateImageProfileURL = "profile/uploadImage";
  static const String kGetPrivacyURL = "privacy-policy";
  static const String kGetTermsURL = "terms";
  static const String kGetAboutUsURL = "how-we-are";
 /// favorite
  static const String kGetFavoriteURL = "fav/list";
  static const String kAddFavoriteURL = "fav/add";
  static const String kRemoveFavoriteURL = "fav/remove";
  static const String kGetFavoriteRestaurantURL = "fav-restaurant/list";
  static const String kAddFavoriteRestaurantURL = "fav-restaurant/add";
  static const String kRemoveFavoriteRestaurantURL = "fav-restaurant/remove";

  /// order
  static const String kRestaurantOrdersURL = "stores/checkout";
  static const String kRateOrdersURL = "stores/checkout/rate-order";
  static  String kOrdersURL({required int id}) => "stores/checkout/details?order_id=$id";

  ///setting
  static const String kGetCitiesURL = "";
  static const String kGetCategoriesURL = "";
  static const String kContactUsRequestURL = "";
  static const String kGetFAGsURL = "";

  ///notifications
  static const String kGetNotificationsURI = '';

  ///offer
  static const String kGetOffersURI = '';
  static const String kGetOfferDetailsURI = '';



}
