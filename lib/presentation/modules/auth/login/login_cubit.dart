import 'package:cogina/domain/logger.dart';
import 'package:cogina/domain/request_body/otp_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/helpers/toast_states/enums.dart';
import '../../../../core/routing/navigation_services.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/globals.dart';
import '../../../../data/datasource/remote/exception/error_widget.dart';
import '../../../../data/model/base/response_model.dart';
import '../../../../data/model/response/otp_model.dart';
import '../../../../data/model/response/user_model.dart';
import '../../../../domain/provider/local_auth_provider_cubit.dart';
import '../../../../domain/request_body/login_body.dart';
import '../../../../domain/usecase/auth/check_otp_usecase.dart';
import '../../../../domain/usecase/auth/sign_in_usecase.dart';
import '../../../../domain/usecase/local/save_data_usecase.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required SignInUseCase signInUseCase,
    required OTPUseCase otpUseCase,
    required SaveUserDataUseCase saveUserDataUseCase,
  })  : _signInUseCase = signInUseCase,
        _otpUseCase = otpUseCase,
        _saveUserDataUseCase = saveUserDataUseCase, super(LoginInitial());
  final SignInUseCase _signInUseCase ;
  final OTPUseCase _otpUseCase ;
  final SaveUserDataUseCase _saveUserDataUseCase ;
  TextEditingController phoneController = TextEditingController();

  static LoginCubit get(BuildContext context)=>BlocProvider.of(context);
  String type='auth';
  void changeType(String x){
    type =x;
    emit(ChangeTypeState());
  }

  ///variables
  final LoginBody _body = LoginBody(phone: '', otp: '');
  final OTPBody _otpBody = OTPBody(phone: '');

  ///getters
  LoginBody get body => _body;
  OTPBody get otpBody => _otpBody;



  ///calling APIs Functions
  Future<ResponseModel> login(String phone, String otp,context) async {
    // // String? fcmToken= await getDeviceToken();
    // if(fcmToken==null){return ResponseModel(false, tr(LocaleKeys.error));}
    emit(LoginLoadingState()) ;
    log('login body ', '$phone/$otp');
    _assignLoginBody(phone, otp);
    ResponseModel responseModel = await _signInUseCase.call(loginBody: body);
    if (responseModel.isSuccess) {
      UserModel userModel = responseModel.data;
      kUser = userModel;
      String token = userModel.data!.token!;
      if (token.isNotEmpty) {
        log('login bod55555y ', '$phone/$otp');

        await _saveUserDataUseCase.call(token: token);
      }
      log('login8888 body ', '$phone/$otp');

      await BlocProvider.of<LocalAuthCubit>(context,listen: false).userLoginSuccessfully();

      NavigationService.pushReplacement(RoutesRestaurants.layout,arguments: {'currentPage':0});
      emit(LoginSuccessState()) ;

    }else{
     emit(LoginErrorState(responseModel.error)) ;
    }
    return responseModel;
  }

  Future<ResponseModel> otpCode(String phone,context) async {
    emit(OtpLoadingState()) ;
    _assignOtpBody(phone);
    ResponseModel responseModel = await _otpUseCase.call(body: otpBody);
    if(responseModel.data!=null){
      AuthModel otpModel =responseModel.data;
      if (responseModel.isSuccess) {
        showToast(text: otpModel.otp.toString(), state: ToastStates.success,
          context: context,gravity: ToastGravity.TOP,timeInSecForIosWeb: 250);
        changeType('otp');
        emit(OtpSuccessState()) ;
      }else{
        log('error', '${otpModel.toJson()}');
        log('error', '${responseModel.message}');
        emit(OtpErrorState()) ;
      }
    }
    return responseModel;
  }

  void _assignLoginBody(String phone,String otp) {
    body.setData(phone: phone, otp: otp);
  }
  void _assignOtpBody(String phone) {
    otpBody.setData(phone: phone);
  }





}
