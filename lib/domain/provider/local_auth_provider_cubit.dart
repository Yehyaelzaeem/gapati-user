import 'package:cogina/domain/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/globals.dart';
import '../../data/model/base/response_model.dart';
import '../usecase/auth/delete_account_usecase.dart';
import '../usecase/local/clear_user_data_usecase.dart';
import '../usecase/local/get_is_login_usecase.dart';
import '../usecase/profile/get_profile_usecase.dart';
import 'local_auth_provider_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> {
  final _tag = 'LocalAuthProvider';

  ///Use Cases
  // final LogoutUseCase _logoutUseCase;
   final IsUserLoginUseCase _isUserLoginUseCase;
  final GetProfileUseCase _getProfileUseCase;
  // final DeleteAccountUseCase _deleteAccountUseCase;
  // final ClearUserDataUseCase _clearUserDataUseCase;
  // final UpdateFCMTokenUseCase _updateFCMTokenUseCase;

  LocalAuthCubit({
    // required LogoutUseCase logoutUseCase,
    // required ClearUserDataUseCase clearUserDataUseCase,
    required IsUserLoginUseCase isUserLoginUseCase,
    required GetProfileUseCase getProfileUseCase,
    // required DeleteAccountUseCase deleteAccountUseCase,
    // required UpdateFCMTokenUseCase updateFCMTokenUseCase,
  })  :
        // _clearUserDataUseCase = clearUserDataUseCase,
        // _logoutUseCase = logoutUseCase,
        _isUserLoginUseCase = isUserLoginUseCase,
        // _deleteAccountUseCase = deleteAccountUseCase,
        // _updateFCMTokenUseCase = updateFCMTokenUseCase,
        _getProfileUseCase = getProfileUseCase,
        super(LocalAuthState());

  ///call APIs Functions
  Future<bool> isLogin() async {
    ResponseModel responseModel = await _isUserLoginUseCase.call();
    if (responseModel.isSuccess) {
      emit(state.copyWith(isLogin: true));
    }
    log('dsssssssssss', responseModel.isSuccess.toString());
    return responseModel.isSuccess;
  }

  // Future<bool> logOut() async {
  //   ResponseModel responseModel = await _logoutUseCase.call();
  //   if(responseModel.isSuccess){
  //     return await _clearUserData();
  //   }else{
  //     return false;
  //   }

  // }
  // Future<bool> _clearUserData() async {
  //
  //   ResponseModel responseModel = await _clearUserDataUseCase.call();
  //   if (responseModel.isSuccess) {
  //     // FirebaseMessaging.instance.deleteToken();
  //     kUser = null;
  //     emit(state.copyWith(isLogin: false));
  //   }
  //   return responseModel.isSuccess;
  // }


  Future<ResponseModel> _getUser() async {
    log(_tag, 'getUser');
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
  // Future<bool> _updateFCMToken() async {
  //   String? fcmToken = await getDeviceToken();
  //   if (fcmToken == null) return false;
  //   ResponseModel responseModel = await _updateFCMTokenUseCase.call(fcmToken: fcmToken);
  //   return responseModel.isSuccess;
  // }

  ///update screens status Function
  void notify(bool loading, String? error) {
    emit(state.copyWith(loading: loading, error: error));
  }

  Future<bool> userLoginSuccessfully() async {
    return true;
  }
}
