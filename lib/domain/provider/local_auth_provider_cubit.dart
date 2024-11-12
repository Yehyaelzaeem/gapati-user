
import 'dart:convert';

import 'package:delivego/core/helpers/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import '../../core/notification/device_token.dart';
import '../../core/routing/routes.dart';
import '../../core/utils/globals.dart';
import '../../data/app_urls/app_url.dart';
import '../../data/datasource/local/storage_keys.dart';
import '../../data/datasource/remote/dio/dio_client.dart';
import '../../data/model/base/response_model.dart';
import '../../data/model/response/address_model.dart';
import '../../presentation/modules/layout/screens/cart/cart_cubit.dart';
import '../usecase/auth/update_fcm_token_usecase.dart';
import '../usecase/local/clear_user_data_usecase.dart';
import '../usecase/local/get_is_login_usecase.dart';
import '../usecase/profile/get_profile_usecase.dart';
import 'local_auth_provider_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> {
  final _tag = 'LocalAuthProvider';

  ///Use Cases
   final IsUserLoginUseCase _isUserLoginUseCase;
  final GetProfileUseCase _getProfileUseCase;
  // final DeleteAccountUseCase _deleteAccountUseCase;
   final ClearUserDataUseCase _clearUserDataUseCase;
  final UpdateFCMTokenUseCase _updateFCMTokenUseCase;

  LocalAuthCubit({
     required ClearUserDataUseCase clearUserDataUseCase,
    required IsUserLoginUseCase isUserLoginUseCase,
    required GetProfileUseCase getProfileUseCase,
    // required DeleteAccountUseCase deleteAccountUseCase,
    required UpdateFCMTokenUseCase updateFCMTokenUseCase,
  })  :
         _clearUserDataUseCase = clearUserDataUseCase,
        _isUserLoginUseCase = isUserLoginUseCase,
        // _deleteAccountUseCase = deleteAccountUseCase,
        _updateFCMTokenUseCase = updateFCMTokenUseCase,
        _getProfileUseCase = getProfileUseCase,
        super(LocalAuthState());

  ///call APIs Functions
   bool isLogin()  {
    final box = GetStorage();
    return box.read(StorageKeys.kIsAuthed)??false;
    // ResponseModel responseModel = await _isUserLoginUseCase.call();
    // if (responseModel.isSuccess) {
    //   emit(state.copyWith(isLogin: true));
    // }
    // return responseModel.isSuccess;
  }
  static Future<void> saveDefaultAddress(AddressModelData addressModelData) async {
    try {
      GetStorage().write(StorageKeys.kAddressModel,  jsonEncode(addressModelData.toJson()));
    } on Exception catch (e) {
      print('e $e');
      rethrow;
    }
  }
  static AddressModelData? getDefaultAddress(){
    var res = GetStorage().read(StorageKeys.kAddressModel);
    if(res==null) return null;
    return  AddressModelData.fromJson(jsonDecode(res));
  }

  Future<bool> logOut(BuildContext context) async {
    ResponseModel responseModel = await _clearUserDataUseCase.call();
    if (responseModel.isSuccess) {
      kUser = null;
       CartCubit.get(context).products.clear();
       context.pushNamedAndRemoveUntil(RoutesRestaurants.splashScreen, predicate: (route) => route.isFirst);
      emit(state.copyWith(isLogin: false));

    }
    return responseModel.isSuccess;
   }


  Future<ResponseModel> _getUser() async {
    notify(true, null);

    ResponseModel responseModel = await _getProfileUseCase.call();
    if (responseModel.isSuccess) {
      // kUser = responseModel.data;
      notify(false, null);
    } else {
      notify(false, responseModel.message);
    }
    return responseModel;
  }

  // Future<ResponseModel> deleteAccount() async {
  //   log(_tag, 'deleteAccount');
  //   notify(true, null);
  //
  //   ResponseModel responseModel = await _deleteAccountUseCase.call();
  //   if (responseModel.isSuccess) {
  //     if (await logOut()) {
  //       notify(false, null);
  //     } else {
  //       notify(false, tr(LocaleKeys.error));
  //     }
  //   } else {
  //     notify(false, responseModel.message);
  //   }
  //   return responseModel;
  // }

  ///update fcm token
  Future<bool> updateFCMToken() async {
    String? fcmToken = await getDeviceToken();
    if (fcmToken == null) return false;
    ResponseModel responseModel = await _updateFCMTokenUseCase.call(fcmToken: fcmToken);
    return responseModel.isSuccess;
  }


  ///update screens status Function
  void notify(bool loading, String? error) {
    emit(state.copyWith(loading: loading, error: error));
  }

  Future<bool> userLoginSuccessfully() async {
    return true;
  }
}
