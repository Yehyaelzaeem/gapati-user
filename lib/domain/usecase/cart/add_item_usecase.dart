import 'package:cogina/data/model/base/api_response.dart';
import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../repository/cart_repo.dart';
import '../../request_body/add_item_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class AddItemUseCase implements BaseUseCase<dynamic>{
  final CartRepository repository;
  AddItemUseCase({required this.repository});
  Future<ResponseModel> call({required AddItemBody addItemBody}) async {
    return BaseUseCaseCall.onGetData<dynamic>( await repository.addItem(addItemBody: addItemBody), onConvert,tag: 'AddItemUseCase');
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
