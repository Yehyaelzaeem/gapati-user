
import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/more_contact_us_model.dart';
import '../../repository/more_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class PrivacyUseCase implements BaseUseCase<MoreContactUsModel>{
  final MoreRepository repository;
  PrivacyUseCase({required this.repository});
  Future<ResponseModel> call() async {
    return BaseUseCaseCall.onGetData<MoreContactUsModel>( await repository.getAboutUs(), onConvert,tag: 'PrivacyUseCase');
  }

  @override
  ResponseModel<MoreContactUsModel> onConvert(BaseModel baseModel) {
    try{
      MoreContactUsModel moreContactUsModel =MoreContactUsModel.fromJson(baseModel.responseData);

      return ResponseModel(baseModel.status??true , baseModel.message,data: moreContactUsModel);
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
