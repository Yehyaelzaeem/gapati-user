import 'package:cogina/domain/request_body/register_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/navigation_services.dart';
import '../../../../core/routing/routes.dart';
import '../../../../data/model/base/response_model.dart';
import '../../../../domain/usecase/auth/register_usecase.dart';
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

  ///calling APIs Functions
  Future<ResponseModel> register(context) async {
    emit(RegisterLoadingState()) ;
    _assignRegisterBody(firstName: firstNameController.text, lastName:  lastNameController.text, phone: phoneController.text);
    ResponseModel responseModel = await _registerUseCase.call(body: body);
    if (responseModel.isSuccess) {
      // AuthModel authModel = responseModel.data;
       NavigationService.push(RoutesRestaurants.registerSuccessScreen);
      emit(RegisterSuccessState()) ;
    }else{
      emit(RegisterErrorState()) ;
    }
    return responseModel;
  }
  void _assignRegisterBody({
    required String firstName,
    required String lastName,
    required String phone}) {
    body.setData(firstName: firstName, lastName: lastName, phone: phone);
  }

}
