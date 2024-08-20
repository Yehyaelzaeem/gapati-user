
import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/home_model.dart';
import '../../../data/model/response/offers_model.dart';
import '../../../data/model/response/profile_model.dart';
import '../../repository/home_repo.dart';
import '../../repository/profile_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class OffersUseCase implements BaseUseCase<OffersModel>{
  final HomeRepository repository;
  OffersUseCase({required this.repository});
  Future<ResponseModel> call() async {
    return BaseUseCaseCall.onGetData<OffersModel>( await repository.getOffers(), onConvert,tag: 'OffersUseCase');
  }

  @override
  ResponseModel<OffersModel> onConvert(BaseModel baseModel) {
    try{
      OffersModel offersModel =OffersModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true, baseModel.message,data: offersModel);
    }catch(e){
      OffersModel offersModel =OffersModel.fromJson(baseModel.responseData);

      return ResponseModel(baseModel.status??false, baseModel.message,data:offersModel);
    }
  }
}
