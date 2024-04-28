import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../repository/cart_repo.dart';
import '../../request_body/update_item_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class UpdateItemUseCase implements BaseUseCase<dynamic>{
  final CartRepository repository;
  UpdateItemUseCase({required this.repository});
  Future<ResponseModel> call({required UpdateItemBody updateItemBody}) async {
    return BaseUseCaseCall.onGetData<dynamic>( await repository.updateItem(updateItemBody: updateItemBody), onConvert,tag: 'UpdateItemUseCase');
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
