import 'package:cogina/presentation/modules/splash/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc.dart';
import 'injection.dart' as injection;
import 'data/injection.dart' as data_injection;
import 'core/global/styles/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(milliseconds: 300));
  await EasyLocalization.ensureInitialized();

  await data_injection.init();
  await injection.init();
//e
  runApp(
       GenerateMultiBloc(
        child:
        DevicePreview(
          enabled: false,
          builder: (context) => const MyApp(),),

      )
     );
}
BuildContext? appContext;
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

   return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            title: 'كُوجِينَا',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: AppColors.primaryColor,
              primaryColorDark: AppColors.primaryColorDark,
               colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor.withOpacity(0.5)),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
          );
      },
    );

  }
}

