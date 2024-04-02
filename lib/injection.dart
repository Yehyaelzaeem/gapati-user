import 'package:cogina/presentation/modules/auth/login/login_cubit.dart';
import 'package:cogina/presentation/modules/auth/register/register_cubit.dart';
import 'package:cogina/presentation/modules/layout/layout_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/cart_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/home/home_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/more/profile/profile_cubit.dart';
import 'package:cogina/presentation/modules/restaurant/restaurant_cubit.dart';
import 'data/injection.dart';
import 'domain/provider/local_auth_provider_cubit.dart';

Future<void> init() async {
  // Bloc
  getIt.registerLazySingleton(() => HomeCubit(homeUseCase: getIt()));
  getIt.registerLazySingleton(() => LayoutCubit(getUserTokenUseCase: getIt(),));
  getIt.registerLazySingleton(() => ProfileCubit(profileUseCase: getIt(), updateProfileUseCase: getIt(),));
  getIt.registerLazySingleton(() => LoginCubit(saveUserDataUseCase: getIt(), signInUseCase: getIt(), otpUseCase: getIt()));
  getIt.registerLazySingleton(() => RegisterCubit(registerUseCase: getIt(),));
  getIt.registerLazySingleton(() => LocalAuthCubit( getProfileUseCase:  getIt()));
  getIt.registerLazySingleton(() => CartCubit(cartUseCase: getIt(), addQTUseCase: getIt(), subQTUseCase: getIt(),
    addItemUseCase: getIt(), deleteItemUseCase: getIt(), mainAddressUseCase: getIt(), addAddressUseCase: getIt(),));
  getIt.registerLazySingleton(() => RestaurantCubit(categoriesUseCase: getIt(), categoryItemsUseCase: getIt(), itemExtraUseCase: getIt()));


}
