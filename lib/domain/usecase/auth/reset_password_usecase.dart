


import '../../../data/datasource/remote/exception/api_checker.dart';
import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../repository/auth_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class ResetPasswordUseCase implements BaseUseCase<dynamic>{


  final AuthRepository repository;

  ResetPasswordUseCase({required this.repository});

  Future<ResponseModel> call({ required String phone, required String password}) async {
    return BaseUseCaseCall.onGetData<dynamic>( await repository.resetPassword(phone: phone,password:password ), onConvert);
  }



  @override
  ResponseModel<dynamic> onConvert(BaseModel baseModel) {
    try{
      if(baseModel.code =='200' ||baseModel.code =='201'){
        return ResponseModel(baseModel.status??true, baseModel.message,data: baseModel.responseData);
      }else{
        return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
      }
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }

}
