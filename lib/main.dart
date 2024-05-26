import 'package:cogina/presentation/modules/intro/splash/splash_screen.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'bloc.dart';
import 'core/notification/notification_service.dart';
import 'core/routing/navigation_services.dart';
import 'core/routing/route_generator.dart';
import 'firebase_options.dart';
import 'injection.dart' as injection;
import 'data/injection.dart' as data_injection;
import 'domain/injection.dart' as domain_injection;
import 'core/global/styles/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(milliseconds: 300));
  await EasyLocalization.ensureInitialized();
  await data_injection.init();
  await domain_injection.init();
  await injection.init();
  await GetStorage.init();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  );
  final NotificationService notificationService = NotificationService();
  notificationService.init();

//pushNamedAndRemoveUntil
  runApp(
       GenerateMultiBloc(
        child:  EasyLocalization(
          supportedLocales: supportedLocales,
          path: 'assets/translation',
          // if device language not supported
          fallbackLocale: supportedLocales[0],
          saveLocale: true,
          useOnlyLangCode: true,
          startLocale: supportedLocales[0],
          child: DevicePreview(
            enabled: false,
            builder: (context) => const MyApp(),
          ),

        )));

}
final supportedLocales = <Locale>[
  const Locale('en'),
  const Locale('ar'),
];
BuildContext appContext=NavigationService.navigationKey.currentContext!;
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

   return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            title:
            // 'Welt App',
            'كُوجِينَا',
            debugShowCheckedModeBanner: false,
          localizationsDelegates: [CountryLocalizations.delegate, ...context.localizationDelegates,],
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          navigatorKey: NavigationService.navigationKey,
          onGenerateRoute: RouteRestaurantsGenerator.generateRestaurantsBaseRoute,
          theme: ThemeData(
              primaryColor: AppColors.primaryColor,
              // AppColors.primaryColor,
              primaryColorDark: AppColors.primaryColorDark,
               colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor.withOpacity(0.5)),
              useMaterial3: true,
            ),
            home:
              const SplashPage(),
            //  const LayoutScreen(currentPage: 0),

          );
      },
    );

  }
}

