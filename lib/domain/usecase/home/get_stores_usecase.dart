
import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/banner_model.dart';
import '../../../data/model/response/home_model.dart';
import '../../../data/model/response/home_params.dart';
import '../../../data/model/response/stores_model.dart';
import '../../repository/home_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class GetStoresUseCase implements BaseUseCase<StoresModel>{
  final HomeRepository repository;
  GetStoresUseCase({required this.repository});
  Future<ResponseModel> call({required HomeParams params}) async {
    return BaseUseCaseCall.onGetData<StoresModel>( await repository.getStores(params: params), onConvert,tag: 'GetStoresUseCase');
  }

  @override
  ResponseModel<StoresModel> onConvert(BaseModel baseModel) {
    print('sadadadsadasd ${baseModel.responseData}');

    StoresModel? storesModel = StoresModel.fromJson(baseModel.responseData);
     print('sadadadsadasd ${storesModel.toJson()}');
    try{
      return ResponseModel(baseModel.status??true, baseModel.message,data: storesModel);
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
