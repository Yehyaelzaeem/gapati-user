import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/otp_model.dart';
import '../../../data/model/response/register_model.dart';
import '../../repository/auth_repo.dart';
import '../../request_body/register_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';

class RegisterUseCase implements BaseUseCase<RegisterModel>{

  final AuthRepository repository;

  RegisterUseCase({required this.repository});

  Future<ResponseModel> call({ required RegisterBody body}) async {
    return BaseUseCaseCall.onGetData<RegisterModel>( await repository.register(registerBody: body), onConvert,tag: 'RegisterUseCase');
  }

  @override
  ResponseModel<RegisterModel> onConvert(BaseModel baseModel) {
    try{
      RegisterModel? registerModel = RegisterModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true, baseModel.message, data: registerModel);
    }catch(e){
      RegisterModel? registerModel = RegisterModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??false, baseModel.message,data: registerModel);
    }
  }


}
