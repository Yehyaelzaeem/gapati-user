
import 'package:cogina/domain/usecase/address/add_address_usecase.dart';
import 'package:cogina/domain/usecase/address/address_usecase.dart';
import 'package:cogina/domain/usecase/address/last_address_usecase.dart';
import 'package:cogina/domain/usecase/address/main_address_usecase.dart';
import 'package:cogina/domain/usecase/auth/check_otp_usecase.dart';
import 'package:cogina/domain/usecase/auth/register_usecase.dart';
import 'package:cogina/domain/usecase/auth/sign_in_usecase.dart';
import 'package:cogina/domain/usecase/cart/add_item_usecase.dart';
import 'package:cogina/domain/usecase/cart/add_qt_usecase.dart';
import 'package:cogina/domain/usecase/cart/cart_usecase.dart';
import 'package:cogina/domain/usecase/cart/delete_item_usecase.dart';
import 'package:cogina/domain/usecase/cart/sub_qt_usecase.dart';
import 'package:cogina/domain/usecase/cart/update_item_usecase.dart';
import 'package:cogina/domain/usecase/check_out/check_out_usecase.dart';
import 'package:cogina/domain/usecase/favorite/add_favorite_usecase.dart';
import 'package:cogina/domain/usecase/favorite/get_favorite_usecase.dart';
import 'package:cogina/domain/usecase/favorite/remove_favorite_usecase.dart';
import 'package:cogina/domain/usecase/home/home_usecase.dart';
import 'package:cogina/domain/usecase/home/offers_usecase.dart';
import 'package:cogina/domain/usecase/local/clear_user_data_usecase.dart';
import 'package:cogina/domain/usecase/local/get_is_login_usecase.dart';
import 'package:cogina/domain/usecase/local/get_user_token_usecase.dart';
import 'package:cogina/domain/usecase/local/save_data_usecase.dart';
import 'package:cogina/domain/usecase/more/about_us_usecase.dart';
import 'package:cogina/domain/usecase/more/privacy_usecase.dart';
import 'package:cogina/domain/usecase/more/terms_usecase.dart';
import 'package:cogina/domain/usecase/orders/orders_usecase.dart';
import 'package:cogina/domain/usecase/profile/get_profile_usecase.dart';
import 'package:cogina/domain/usecase/profile/update_profile_usecase.dart';
import 'package:cogina/domain/usecase/restaurant/categories_usecase.dart';
import 'package:cogina/domain/usecase/restaurant/category_items_usecase.dart';
import 'package:cogina/domain/usecase/restaurant/item_extra_usecase.dart';
import 'package:cogina/domain/usecase/restaurant/search_items_usecase.dart';
import 'package:cogina/domain/usecase/search/search_usecase.dart';

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

   ///Profile
   getIt.registerLazySingleton(() => GetProfileUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => UpdateProfileUseCase(repository: getIt()));

   ///Home
   getIt.registerLazySingleton(() => HomeUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => OffersUseCase(repository: getIt()));
   ///Search
   getIt.registerLazySingleton(() => SearchUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => SearchItemsUseCase(repository: getIt()));


   ///Restaurant
   getIt.registerLazySingleton(() => CategoriesUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => CategoryItemsUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => ItemExtraUseCase(repository: getIt()));


   ///Cart
   getIt.registerLazySingleton(() => CartUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => AddQTUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => SubQTUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => AddItemUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => DeleteItemUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => MainAddressUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => LastAddressUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => AddAddressUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => AddressUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => UpdateItemUseCase(repository: getIt()));


   ///CheckOut
  getIt.registerLazySingleton(() => CheckOutUseCase(repository: getIt()));

  ///orders
     getIt.registerLazySingleton(() => OrdersUseCase(repository: getIt()));
  ///more
   getIt.registerLazySingleton(() => TermsUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => PrivacyUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => AboutUsUseCase(repository: getIt()));
 ///favorite
   getIt.registerLazySingleton(() => GetFavoriteUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => AddFavoriteUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => RemoveFavoriteUseCase(repository: getIt()));

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