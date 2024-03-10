
import 'package:cogina/presentation/modules/layout/layout_cubit.dart';

import 'data/injection.dart';
import 'presentation/modules/layout/screens/home/home_cubit.dart';

Future<void> init() async {
  // Bloc

  getIt.registerLazySingleton(() => HomeCubit());

  // getIt.registerLazySingleton(() => OtpCubit(saveUserDataUseCase: getIt(), forgetPasswordUseCase: getIt(),otpUseCase:  getIt(),updateFCMTokenUseCase:  getIt()));
  getIt.registerLazySingleton(() => LayoutCubit());

}
