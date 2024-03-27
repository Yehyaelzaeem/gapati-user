import 'package:cogina/domain/logger.dart';

import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/otp_model.dart';
import '../../repository/auth_repo.dart';
import '../../request_body/otp_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class OTPUseCase implements BaseUseCase<AuthModel>{

  final AuthRepository repository;
  OTPUseCase({required this.repository});
  Future<ResponseModel> call({ required OTPBody body}) async {
    return BaseUseCaseCall.onGetData<AuthModel>( await repository.otpCode(otpBody: body), onConvert);
  }


  @override
  ResponseModel<AuthModel> onConvert(BaseModel baseModel) {
    try{
      AuthModel? otpModel = AuthModel.fromJson(baseModel.responseData);
      log('5555555', baseModel.responseData.toString());
  //otpCode otpCode
      return ResponseModel(true, baseModel.message, data: otpModel);
    }catch(e){
      return ResponseModel(true, baseModel.message,data: baseModel.responseData);
    }
  }
}
