import 'package:cogina/presentation/modules/auth/login/login_cubit.dart';
import 'package:cogina/presentation/modules/auth/register/register_cubit.dart';
import 'package:cogina/presentation/modules/layout/layout_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/cart_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/check_out/check_out_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/home/home_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/more/address/address_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/more/profile/profile_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/orders/orders_cubit.dart';
import 'package:cogina/presentation/modules/restaurant/restaurant_cubit.dart';
import 'data/injection.dart';
import 'domain/provider/local_auth_provider_cubit.dart';

Future<void> init() async {
  // Bloc
  getIt.registerLazySingleton(() => LayoutCubit(getUserTokenUseCase: getIt(),));
  getIt.registerLazySingleton(() => ProfileCubit(profileUseCase: getIt(), updateProfileUseCase: getIt(),));
  getIt.registerLazySingleton(() => HomeCubit(homeUseCase: getIt(), offersUseCase:  getIt()));
  getIt.registerLazySingleton(() => LoginCubit(saveUserDataUseCase: getIt(), signInUseCase: getIt(), otpUseCase: getIt()));
  getIt.registerLazySingleton(() => RegisterCubit(registerUseCase: getIt(),));
  getIt.registerLazySingleton(() => LocalAuthCubit( getProfileUseCase:  getIt(), isUserLoginUseCase: getIt(), clearUserDataUseCase: getIt()));
  getIt.registerLazySingleton(() => CartCubit(cartUseCase: getIt(), addQTUseCase: getIt(), subQTUseCase: getIt(),
    addItemUseCase: getIt(), deleteItemUseCase: getIt(),));
  getIt.registerLazySingleton(() => RestaurantCubit(categoriesUseCase: getIt(), categoryItemsUseCase: getIt(), itemExtraUseCase: getIt()));
  getIt.registerLazySingleton(() => CheckOutCubit( checkOutUseCase:  getIt(),));
  getIt.registerLazySingleton(() => OrdersCubit(ordersUseCase: getIt()));
  getIt.registerLazySingleton(() => AddressCubit(addAddressUseCase: getIt(), mainAddressUseCase: getIt(), addressUseCase: getIt()));

}
