

import 'package:cogina/data/repository/auth_repository_imp.dart';
import 'package:cogina/data/repository/cart_repository_imp.dart';
import 'package:cogina/data/repository/check_out_repository_imp.dart';
import 'package:cogina/data/repository/home_repository_imp.dart';
import 'package:cogina/data/repository/local_repository_imp.dart';
import 'package:cogina/data/repository/profile_repository_imp.dart';
import 'package:cogina/data/repository/restaurant_repository_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../core/services/network/api_consumer.dart';
import '../domain/repository/auth_repo.dart';
import '../domain/repository/cart_repo.dart';
import '../domain/repository/check_out_repo.dart';
import '../domain/repository/home_repo.dart';
import '../domain/repository/local_repo.dart';
import '../domain/repository/profile_repo.dart';
import '../domain/repository/restaurant_repo.dart';
import 'app_urls/app_url.dart';
import 'datasource/local/cache_consumer.dart';
import 'datasource/remote/dio/dio_client.dart';
import 'datasource/remote/dio/logging_interceptor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  /// Core
  getIt.registerLazySingleton(() => DioClient(AppURL.kBaseURL, getIt(), loggingInterceptor: getIt(), cacheConsumer:  getIt()));

  /// Repository
   getIt.registerLazySingleton<LocalRepository>(() => LocalRepositoryImp(dioClient: getIt(),cacheConsumer: getIt()));
   getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(dioClient: getIt()));
   getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImp(dioClient: getIt()));
   getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(dioClient: getIt()));
   getIt.registerLazySingleton<RestaurantRepository>(() => RestaurantRepositoryImp(dioClient: getIt()));
   getIt.registerLazySingleton<CartRepository>(() => CartRepositoryImp(dioClient: getIt()));
   getIt.registerLazySingleton<CheckOutRepository>(() => CheckOutRepositoryImp(dioClient: getIt()));
  // getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImp(dioClient: getIt()));
  // getIt.registerLazySingleton<SettingRepository>(() => SettingRepositoryImp(dioClient: getIt()));
  // getIt.registerLazySingleton<NotificationRepository>(() => NotificationRepositoryImp(dioClient: getIt()));
  // getIt.registerLazySingleton<OfferRepository>(() => OfferRepositoryImp(dioClient: getIt()));


  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => LoggingInterceptor());
  getIt.registerLazySingleton(() => const FlutterSecureStorage());
  getIt.registerLazySingleton(() => CacheConsumer(secureStorage: getIt() ,sharedPreferences: getIt()));



  getIt.registerLazySingleton<PrettyDioLogger>(() => PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true),);
  getIt.registerLazySingleton(() => ApiConsumer(getIt<Dio>(), getIt<PrettyDioLogger>(), getIt()));


}