
import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/banner_model.dart';
import '../../../data/model/response/home_model.dart';
import '../../repository/home_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class BannerUseCase implements BaseUseCase<BannersModel>{
  final HomeRepository repository;
  BannerUseCase({required this.repository});
  Future<ResponseModel> call() async {
    return BaseUseCaseCall.onGetData<BannersModel>( await repository.getBanner(), onConvert,tag: 'BannerUseCase');
  }

  @override
  ResponseModel<BannersModel> onConvert(BaseModel baseModel) {
    try{
      BannersModel? bannersModel = BannersModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true, baseModel.message,data: bannersModel);
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
