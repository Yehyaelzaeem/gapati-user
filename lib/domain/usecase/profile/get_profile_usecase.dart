
import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/profile_model.dart';
import '../../repository/profile_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class GetProfileUseCase implements BaseUseCase<GetProfileModel>{
  final ProfileRepository repository;
  GetProfileUseCase({required this.repository});
  Future<ResponseModel> call() async {
    return BaseUseCaseCall.onGetData<GetProfileModel>( await repository.profile(), onConvert,tag: 'ProfileUseCase');
  }

  @override
  ResponseModel<GetProfileModel> onConvert(BaseModel baseModel) {
    try{
      GetProfileModel? profileModel = GetProfileModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true, baseModel.message,data: profileModel);
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
