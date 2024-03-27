
import 'package:cogina/domain/usecase/auth/check_otp_usecase.dart';
import 'package:cogina/domain/usecase/auth/register_usecase.dart';
import 'package:cogina/domain/usecase/auth/sign_in_usecase.dart';
import 'package:cogina/domain/usecase/cart/cart_usecase.dart';
import 'package:cogina/domain/usecase/home/home_usecase.dart';
import 'package:cogina/domain/usecase/local/clear_user_data_usecase.dart';
import 'package:cogina/domain/usecase/local/get_is_login_usecase.dart';
import 'package:cogina/domain/usecase/local/get_user_token_usecase.dart';
import 'package:cogina/domain/usecase/local/save_data_usecase.dart';
import 'package:cogina/domain/usecase/profile/get_profile_usecase.dart';
import 'package:cogina/domain/usecase/profile/update_profile_usecase.dart';
import 'package:cogina/domain/usecase/restaurant/categories_usecase.dart';
import 'package:cogina/domain/usecase/restaurant/category_items_usecase.dart';
import 'package:cogina/domain/usecase/restaurant/item_extra_usecase.dart';

import '../data/injection.dart';


Future<void> init() async {


  ///local
  // getIt.registerLazySingleton(() => ClearUserDataUseCase(repository: getIt()));
  // getIt.registerLazySingleton(() => IsUserLoginUseCase(repository: getIt()));
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


   ///Restaurant
   getIt.registerLazySingleton(() => CategoriesUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => CategoryItemsUseCase(repository: getIt()));
   getIt.registerLazySingleton(() => ItemExtraUseCase(repository: getIt()));


   ///Cart
   getIt.registerLazySingleton(() => CartUseCase(repository: getIt()));


  ///more
  // getIt.registerLazySingleton(() => GetProfileUseCase(repository: getIt()));
  // getIt.registerLazySingleton(() => UpdateProfileUseCase(repository: getIt()));


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