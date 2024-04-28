class AppURL {

  static const String kAPIKey = "";
  static const String kBaseURL = "http://kogena.dev03.matrix-clouds.com/api/";

  ///Auth
  static const String kLoginURI = "auth/otp";
  static const String kOtpURI = "auth/login";
  static const String kRegisterURI = "auth/register";
  static const String kLogoutURI = "auth/logout";

  static const String kForgetPasswordURI = "auth/otp";
  static const String kCheckOTPURI = "auth/check-otp";
  static const String kResetPasswordURI = "";
  static const String kDeleteAccountURI = "";
  static const String kUpdateFCMTokenURI = "fcm_token";

  ///home
  static const String kHomeURI = "home";
  static const String kOffersURI = "stores/offers";
  static  String kCategoriesURI (int id)=> "stores/all-categories?store_id=$id";
  static  String kItemExtraURI (int id)=> "stores/items/single?item_id=$id";
  static  String kCategoriesItemsURI ({required int categoryId,required int storeId})=> "stores/categories?category_id=$categoryId&store_id=$storeId";
  ///Cart
  static const String kGetCartURL = "shopping-cart";
  static const String kAddQtURL = "shopping-cart/add";
  static const String kSubQtURL = "shopping-cart/sub";
  static const String kAddItemURL = "shopping-cart/insert";
  static const String kUpdateItemURL = "shopping-cart/update";
  static const String kDeleteItemURL = "shopping-cart/delete";
  static const String kGetMainAddressURL = "other-trip/get-main-address";
  static const String kGetLastAddressURL = "last-address";
  static const String kGetAllAddressURL = "other-trip/all-address";
  static const String kAddMainAddressURL = "other-trip/main-address";
  ///checkout
  static const String kCheckOutURL = "stores/checkout/store";
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

  /// order
  static const String kRestaurantOrdersURL = "stores/checkout";
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
