import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/helpers/toast_states/enums.dart';
import '../../../../data/model/base/response_model.dart';
import '../../../../data/model/response/register_model.dart';
import '../../../../domain/request_body/register_body.dart';
import '../../../../domain/usecase/auth/register_usecase.dart';
import '../login/login_cubit.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required RegisterUseCase registerUseCase}) :_registerUseCase=registerUseCase, super(RegisterInitial());
  final RegisterUseCase _registerUseCase;
  static RegisterCubit get(BuildContext context)=>BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  ///variables
  final RegisterBody _body = RegisterBody(firstName: '', lastName: '', mobile: '');

  ///getters
  RegisterBody get body => _body;

  String type ='register';
  ///calling APIs Functions
  Future<ResponseModel?> register(context) async {
    LoginCubit cubit =LoginCubit.get(context);
    cubit.phoneController.text=phoneController.text;
    emit(RegisterLoadingState()) ;
    try{
      _assignRegisterBody(firstName: firstNameController.text, lastName:  lastNameController.text, phone: phoneController.text);
      ResponseModel responseModel = await _registerUseCase.call(body: body);
      RegisterModel registerModel =responseModel.data;
      if(responseModel.data!=null){
        if (responseModel.isSuccess) {
          showToast(text: registerModel.data!.otp.toString(), state: ToastStates.success,
              context: context,gravity: ToastGravity.TOP,timeInSecForIosWeb: 250);
          changeType('otp');
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
    required String phone}) {
    body.setData(firstName: firstName, lastName: lastName, phone: phone);
  }
  void changeType(String _type){
    type=_type;
    emit(ChangeTypeState()) ;

  }

}
