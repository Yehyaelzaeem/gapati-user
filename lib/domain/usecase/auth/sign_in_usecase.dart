import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../repository/auth_repo.dart';
import '../../request_body/login_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class SignInUseCase implements BaseUseCase<UserModel>{


  final AuthRepository repository;

  SignInUseCase({required this.repository});

  Future<ResponseModel> call({ required LoginBody loginBody}) async {
    return BaseUseCaseCall.onGetData<UserModel>( await repository.login(loginBody: loginBody), onConvert,showError: true,tag: 'SignInUseCase');
  }

  @override
  ResponseModel<UserModel> onConvert(BaseModel baseModel) {
    try{
      UserModel? user = UserModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true, baseModel.message,data: user);
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
