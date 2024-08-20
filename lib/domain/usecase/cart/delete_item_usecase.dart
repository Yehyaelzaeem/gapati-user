import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../repository/cart_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class DeleteItemUseCase implements BaseUseCase<dynamic>{
  final CartRepository repository;
  DeleteItemUseCase({required this.repository});
  Future<ResponseModel> call({required String itemId}) async {
    return BaseUseCaseCall.onGetData<dynamic>( await repository.deleteItem(itemId: itemId), onConvert,tag: 'AddQTUseCase');
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
