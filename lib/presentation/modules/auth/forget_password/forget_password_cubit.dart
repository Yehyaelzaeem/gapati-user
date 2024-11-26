import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/helpers/toast_states/enums.dart';
import '../../../../core/routing/routes.dart';
import '../../../../data/model/base/response_model.dart';
import '../../../../domain/usecase/auth/forget_password_usecase.dart';
import '../../../../domain/usecase/auth/reset_password_usecase.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  ForgetPasswordCubit({required this.forgetPasswordUseCase,required this.resetPasswordUseCase}) : super(ForgetPasswordInitial());
  TextEditingController phoneController = TextEditingController();


  String? otpCode;
  Future<void> forgetPassword(String phone) async {
    otpCode=null;
    emit(ForgetPasswordLoadingState());
    try{
      ResponseModel responseModel = await forgetPasswordUseCase.call(phone: phone);
      if(responseModel.isSuccess){
        otpCode= responseModel.data['data']['otp'].toString();
        emit(ForgetPasswordSuccessState());
      }else{
        emit(ForgetPasswordErrorState());
      }
    }catch (e){
      emit(ForgetPasswordErrorState());
    }
  }

  Future<void> resetPassword(String phone,String password,BuildContext context) async {
    emit(ResetPasswordLoadingState());
    try{
      ResponseModel responseModel = await resetPasswordUseCase.call(phone: phone,password: password);
      if(responseModel.isSuccess){
        showToast(text: 'Success Reset Password',gravity: ToastGravity.TOP, state: ToastStates.success, context: context);
        phoneController.text='';
        otpCode=null;
        Navigator.pushNamedAndRemoveUntil(context, RoutesRestaurants.loginScreen, ModalRoute.withName(RoutesRestaurants.loginScreen));
        emit(ResetPasswordSuccessState());
      }else{
        emit(ResetPasswordErrorState());
      }
    }catch (e){
      emit(ResetPasswordErrorState());
    }
  }

  void checkOtp({required String otp,required BuildContext context}){
    emit(CheckOtpLoadingState());
    Future.delayed(const Duration(seconds: 1),).then((value) {
      try{

        if(otpCode!=null && otpCode==otp){
          print('otpCode $otpCode');
          Navigator.pushNamed(context, RoutesRestaurants.changePasswordScreen,arguments: {'phone':phoneController.text});
          print('otp $otp');

          showToast(text: 'Success OTP',gravity: ToastGravity.TOP, state: ToastStates.success, context: context);

          // otpCode=null;
          emit(CheckOtpSuccessState());
        }else{
          showToast(text: 'Invalid OTP',gravity: ToastGravity.TOP, state: ToastStates.error, context: context);
          emit(CheckOtpErrorState());
        }
      }catch (e){
        emit(CheckOtpErrorState());
      }
    });

  }


}
