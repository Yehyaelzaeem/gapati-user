
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/helpers/toast_states/enums.dart';
import '../../../../core/routing/navigation_services.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/globals.dart';
import '../../../../data/datasource/local/cache_consumer.dart';
import '../../../../data/datasource/remote/exception/error_widget.dart';
import '../../../../data/injection.dart';
import '../../../../data/model/base/response_model.dart';
import '../../../../data/model/response/otp_model.dart';
import '../../../../data/model/response/user_model.dart';
import '../../../../domain/provider/local_auth_provider_cubit.dart';
import '../../../../domain/request_body/login_body.dart';
import '../../../../domain/request_body/otp_body.dart';
import '../../../../domain/usecase/auth/check_otp_usecase.dart';
import '../../../../domain/usecase/auth/sign_in_usecase.dart';
import '../../../../domain/usecase/local/save_data_usecase.dart';
import '../../layout/layout_cubit.dart';
import '../register/register_cubit.dart';
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


//tr(LocaleKeys.error)
  ///calling APIs Functions
  Future<ResponseModel> login(String phone, String otp,context) async {
    // // String? fcmToken= await getDeviceToken();
    // if(fcmToken==null){return ResponseModel(false, tr(LocaleKeys.error));}
    emit(LoginLoadingState()) ;
    _assignLoginBody(phone, otp);
    ResponseModel responseModel = await _signInUseCase.call(loginBody: body);
    if (responseModel.isSuccess) {
      UserModel userModel = responseModel.data;
      kUser = userModel;
      String token = userModel.data!.token!;
      if (token.isNotEmpty) {
        await _saveUserDataUseCase.call(token: token);
      }
      await BlocProvider.of<LocalAuthCubit>(context,listen: false).userLoginSuccessfully();
      phoneController.text='';
      RegisterCubit registerCubit =RegisterCubit.get(context);
      registerCubit.phoneController.text='';
      registerCubit.lastNameController.text='';
      registerCubit.firstNameController.text='';
      CacheConsumer cacheConsumer =CacheConsumer(secureStorage: getIt(), sharedPreferences: getIt(),);
      var key =cacheConsumer.get('visitor');
      LayoutCubit layoutCubit=LayoutCubit.get(context);
       if(key!=null){
         layoutCubit.initLayOut();
         if(key=='favorite'){
           NavigationService.pushNamedAndRemoveUntil(RoutesRestaurants.layout,arguments: {'currentPage':1});
         }
         else if(key=='orders'){
           NavigationService.pushNamedAndRemoveUntil(RoutesRestaurants.layout,arguments: {'currentPage':2});
         } else if(key=='more'){
           NavigationService.pushNamedAndRemoveUntil(RoutesRestaurants.layout,arguments: {'currentPage':4});
         } else if(key=='checkOut'){
           NavigationService.pushNamedAndRemoveUntil(RoutesRestaurants.checkOut,);
         }
         else {
           NavigationService.pushNamedAndRemoveUntil(RoutesRestaurants.layout,arguments: {'currentPage':0});
         }
       }
       else{
         NavigationService.pushNamedAndRemoveUntil(RoutesRestaurants.layout,arguments: {'currentPage':0});
       }
      emit(LoginSuccessState()) ;
    }else{
     emit(LoginErrorState(responseModel.error)) ;
    }
    return responseModel;
  }

  Future<ResponseModel?> otpCode(String phone,context) async {
    emit(OtpLoadingState()) ;
    try{
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

          emit(OtpErrorState()) ;
        }
      }
    }catch (e){
      emit(OtpErrorState()) ;
    }
    emit(OtpSuccessState()) ;
    return null;
  }

  void _assignLoginBody(String phone,String otp) {
    body.setData(phone: phone, otp: otp);
  }
  void _assignOtpBody(String phone) {
    otpBody.setData(phone: phone);
  }

  Future<void> visitorLocation({required String screenName}) async{
    CacheConsumer cacheConsumer =CacheConsumer(secureStorage: getIt(), sharedPreferences: getIt(),);
    cacheConsumer.save('visitor', screenName);
    emit(VisitorState()) ;
  }






}
