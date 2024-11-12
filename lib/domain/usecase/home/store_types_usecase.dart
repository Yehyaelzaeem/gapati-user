
import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/banner_model.dart';
import '../../../data/model/response/home_model.dart';
import '../../../data/model/response/store_types_model.dart';
import '../../repository/home_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class StoreTypesUseCase implements BaseUseCase<StoreTypesModel>{
  final HomeRepository repository;
  StoreTypesUseCase({required this.repository});
  Future<ResponseModel> call() async {
    return BaseUseCaseCall.onGetData<StoreTypesModel>( await repository.getStoreTypes(), onConvert,tag: 'StoreTypesUseCase');
  }

  @override
  ResponseModel<StoreTypesModel> onConvert(BaseModel baseModel) {
    try{
      StoreTypesModel? storeTypesModel = StoreTypesModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true, baseModel.message,data: storeTypesModel);
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
