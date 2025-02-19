
import 'package:delivego/domain/usecase/address/add_address_usecase.dart';
import 'package:delivego/domain/usecase/address/address_usecase.dart';
import 'package:delivego/domain/usecase/address/delete_address_usecase.dart';
import 'package:delivego/domain/usecase/address/last_address_usecase.dart';
import 'package:delivego/domain/usecase/address/main_address_usecase.dart';
import 'package:delivego/domain/usecase/address/update_address_usecase.dart';
import 'package:delivego/domain/usecase/auth/check_otp_usecase.dart';
import 'package:delivego/domain/usecase/auth/forget_password_usecase.dart';
import 'package:delivego/domain/usecase/auth/register_usecase.dart';
import 'package:delivego/domain/usecase/auth/reset_password_usecase.dart';
import 'package:delivego/domain/usecase/auth/sign_in_usecase.dart';
import 'package:delivego/domain/usecase/auth/update_fcm_token_usecase.dart';
import 'package:delivego/domain/usecase/cart/add_item_usecase.dart';
import 'package:delivego/domain/usecase/cart/add_qt_usecase.dart';
import 'package:delivego/domain/usecase/cart/cart_usecase.dart';
import 'package:delivego/domain/usecase/cart/delete_item_usecase.dart';
import 'package:delivego/domain/usecase/cart/sub_qt_usecase.dart';
import 'package:delivego/domain/usecase/cart/update_item_usecase.dart';
import 'package:delivego/domain/usecase/check_out/check_out_usecase.dart';
import 'package:delivego/domain/usecase/check_out/get_delivery_fees_usecase.dart';
import 'package:delivego/domain/usecase/check_out/get_nearest_branch_usecase.dart';
import 'package:delivego/domain/usecase/favorite/add_favorite_restaurant_usecase.dart';
import 'package:delivego/domain/usecase/favorite/add_favorite_usecase.dart';
import 'package:delivego/domain/usecase/favorite/get_favorite_resataurant_usecase.dart';
import 'package:delivego/domain/usecase/favorite/get_favorite_usecase.dart';
import 'package:delivego/domain/usecase/favorite/remove_favorite_restaurant_usecase.dart';
import 'package:delivego/domain/usecase/favorite/remove_favorite_usecase.dart';
import 'package:delivego/domain/usecase/home/accept_prescription_usecase.dart';
import 'package:delivego/domain/usecase/home/banner_usecase.dart';
import 'package:delivego/domain/usecase/home/get_prescriptions_usecase.dart';
import 'package:delivego/domain/usecase/home/get_stores_usecase.dart';
import 'package:delivego/domain/usecase/home/home_usecase.dart';
import 'package:delivego/domain/usecase/home/offers_usecase.dart';
import 'package:delivego/domain/usecase/home/prescription_usecase.dart';
import 'package:delivego/domain/usecase/home/resturants_usecase.dart';
import 'package:delivego/domain/usecase/home/home_categories.dart';
import 'package:delivego/domain/usecase/local/clear_user_data_usecase.dart';
import 'package:delivego/domain/usecase/local/get_is_login_usecase.dart';
import 'package:delivego/domain/usecase/local/get_user_token_usecase.dart';
import 'package:delivego/domain/usecase/local/save_data_usecase.dart';
import 'package:delivego/domain/usecase/more/about_us_usecase.dart';
import 'package:delivego/domain/usecase/more/privacy_usecase.dart';
import 'package:delivego/domain/usecase/more/terms_usecase.dart';
import 'package:delivego/domain/usecase/orders/orders_usecase.dart';
import 'package:delivego/domain/usecase/orders/rate_usecase.dart';
import 'package:delivego/domain/usecase/profile/get_profile_usecase.dart';
import 'package:delivego/domain/usecase/profile/update_profile_usecase.dart';
import 'package:delivego/domain/usecase/restaurant/best_dish_usecase.dart';
import 'package:delivego/domain/usecase/restaurant/categories_usecase.dart';
import 'package:delivego/domain/usecase/restaurant/category_items_usecase.dart';
import 'package:delivego/domain/usecase/restaurant/item_extra_usecase.dart';
import 'package:delivego/domain/usecase/restaurant/search_items_usecase.dart';
import 'package:delivego/domain/usecase/search/search_usecase.dart';

import '../data/injection.dart';


Future<void> init() async {


  ///local
   getIt.registerLazySingleton(() => ClearUserDataUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => IsUserLoginUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => GetUserTokenUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => SaveUserDataUseCase(repository: getIt()));

  ///Auth
   getIt.registerLazySingleton(() => SignInUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => OTPUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => RegisterUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => UpdateFCMTokenUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => ForgetPasswordUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => ResetPasswordUseCase(repository: getIt()));

   ///Profile
   getIt.registerLazySingleton(() => GetProfileUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => UpdateProfileUseCase(repository: getIt()));

   ///Home
   getIt.registerLazySingleton(() => HomeUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => OffersUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => RestaurantsUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => BannerUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => HomeCategoriesUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => GetStoresUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => PrescriptionUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => GetPrescriptionsUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => AcceptPrescriptionUseCase(repository: getIt()));
   ///Search
   getIt.registerLazySingleton(() => SearchUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => SearchItemsUseCase(repository: getIt()));


   ///Restaurant
   getIt.registerLazySingleton(() => CategoriesUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => CategoryItemsUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => ItemExtraUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => BestDishUseCase(repository: getIt()));


   ///Cart
   getIt.registerLazySingleton(() => CartUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => AddQTUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => SubQTUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => AddItemUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => DeleteItemUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => MainAddressUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => LastAddressUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => UpdateItemUseCase(repository: getIt()));

 ///Address
   getIt.registerLazySingleton(() => UpdateAddressUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => AddAddressUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => AddressUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => DeleteAddressUseCase(repository: getIt()));

   ///CheckOut
  getIt.registerLazySingleton(() => CheckOutUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetDeliveryFeesUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetNearestBranchUseCase(repository: getIt()));

  ///orders
     getIt.registerLazySingleton(() => OrdersUseCase(repository: getIt()));
     getIt.registerLazySingleton(() => RateUseCase(repository: getIt()));
  ///more
   getIt.registerLazySingleton(() => TermsUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => PrivacyUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => AboutUsUseCase(repository: getIt()));
 ///favorite
   getIt.registerLazySingleton(() => GetFavoriteUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => AddFavoriteUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => RemoveFavoriteUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => GetFavoriteRestaurantUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => AddFavoriteRestaurantUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => RemoveFavoriteRestaurantUseCase(repository: getIt()));

  ///notifications
  // getIt.registerLazySingleton(() => GetNotificationsUseCase(repository: getIt()));
  //
  //
  // ///setting
  // getIt.registerLazySingleton(() => GetCitiesUseCase(repository: getIt()));
  // getIt.registerLazySingleton(() => GetCategoriesUseCase(repository: getIt()));
  // getIt.registerLazySingleton(() => ContactUsRequestUseCase(repository: getIt()));
  // getIt.registerLazySingleton(() => GetFQAsUseCase(repository: getIt()));
  //
  // ///country
  // getIt.registerLazySingleton(() => GetCountriesUseCase(repository: getIt()));
  //
  // ///offer
  // getIt.registerLazySingleton(() => GetOffersUseCase(repository: getIt()));

}