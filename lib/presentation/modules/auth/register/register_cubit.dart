import 'package:delivego/core/helpers/extensions.dart';
import 'package:delivego/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/helpers/toast_states/enums.dart';
import '../../../../core/routing/navigation_services.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/globals.dart';
import '../../../../data/model/base/response_model.dart';
import '../../../../data/model/response/register_model.dart';
import '../../../../data/model/response/user_model.dart';
import '../../../../domain/provider/local_auth_provider_cubit.dart';
import '../../../../domain/request_body/register_body.dart';
import '../../../../domain/usecase/auth/register_usecase.dart';
import '../../../../domain/usecase/local/save_data_usecase.dart';
import '../login/login_cubit.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required RegisterUseCase registerUseCase,required SaveUserDataUseCase saveUserDataUseCase}) :
        _registerUseCase=registerUseCase,
        _saveUserDataUseCase=saveUserDataUseCase,
        super(RegisterInitial());
  final RegisterUseCase _registerUseCase;
  final SaveUserDataUseCase _saveUserDataUseCase ;

  static RegisterCubit get(BuildContext context)=>BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  ///variables
  final RegisterBody _body = RegisterBody(firstName: '', lastName: '', mobile: '',password: '',confirmPassword: '',email: '');

  ///getters
  RegisterBody get body => _body;

  String type ='register';
  ///calling APIs Functions
  Future<ResponseModel?> register(context) async {
    LoginCubit cubit =LoginCubit.get(context);
    cubit.phoneController.text=phoneController.text;
    emit(RegisterLoadingState()) ;
    try{
      _assignRegisterBody(firstName: firstNameController.text, lastName:  lastNameController.text,
          phone: phoneController.text,password: passwordController.text,confirmPassword: confirmPasswordController.text,email: emailController.text);
      ResponseModel responseModel = await _registerUseCase.call(body: body);


      if(responseModel.data!=null){
        RegisterModel registerModel =responseModel.data;
        if (responseModel.isSuccess) {
          // showToast(text: registerModel.data!.otp.toString(), state: ToastStates.success, context: context,gravity: ToastGravity.TOP,timeInSecForIosWeb: 250);
          // changeType('otp');
          LoginModelData userModel = registerModel.data??LoginModelData();
          print('sssssssssssssssssssssssssssssssssssssssssssssssssss');

          print(userModel.name??'');
          print('sssssssssssssssssssssssssssssssssssssssssssssssssss');

          kUser = userModel;
          String token = userModel.token??'';
          if (token.isNotEmpty && token.isNotEmpty) {
            await _saveUserDataUseCase.call(token: token);
          }
          print('ssssssssssadssssssssssssssssssssssssssssssssssssssssss');
          // await BlocProvider.of<LocalAuthCubit>(context,listen: false).userLoginSuccessfully();
          phoneController.text='';
          RegisterCubit registerCubit =RegisterCubit.get(context);
          registerCubit.phoneController.text='';
          registerCubit.lastNameController.text='';
          registerCubit.firstNameController.text='';
          registerCubit.emailController.text='';
          registerCubit.passwordController.text='';
          registerCubit.confirmPasswordController.text='';
          if( token.isNotEmpty){
            NavigationService.pushNamedAndRemoveUntil(RoutesRestaurants.layout,arguments: {'currentPage':0});
          }

          emit(RegisterSuccessState()) ;
        }else{
          emit(RegisterErrorState()) ;
        }
      }else{
      }
      emit(RegisterSuccessState()) ;
      return responseModel;
    }catch (e){
      emit(RegisterErrorState()) ;
    }
    emit(RegisterErrorState()) ;
    return null;
  }
  void _assignRegisterBody({
    required String firstName,
    required String lastName,
    required String phone,
    required String password,
    required String confirmPassword,
    required String email,

  }) {
    body.setData(firstName: firstName, lastName: lastName, phone: phone,password: password,confirmPassword: confirmPassword,email: email);
  }
  void changeType(String _type){
    type=_type;
    emit(ChangeTypeState()) ;

  }

}
