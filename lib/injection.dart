

import 'package:cogina/presentation/modules/provider/auth/auth_cubit.dart';
import 'package:cogina/presentation/modules/provider/layout/provider_layout_cubit.dart';
import 'package:cogina/presentation/modules/provider/layout/screens/home/provider_home_cubit.dart';
import 'package:cogina/presentation/modules/user/layout/layout_cubit.dart';
import 'package:cogina/presentation/modules/user/layout/screens/home/home_cubit.dart';

import 'data/injection.dart';

Future<void> init() async {
  // Bloc

  getIt.registerLazySingleton(() => HomeCubit());
  getIt.registerLazySingleton(() => LayoutCubit());
  getIt.registerLazySingleton(() => AuthCubit());
  getIt.registerLazySingleton(() => ProviderLayoutCubit());
  getIt.registerLazySingleton(() => ProviderHomeCubit());

}
