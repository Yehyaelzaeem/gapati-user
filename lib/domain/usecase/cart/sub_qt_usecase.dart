import 'package:cogina/data/model/base/api_response.dart';
import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../repository/cart_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class SubQTUseCase implements BaseUseCase<dynamic>{
  final CartRepository repository;
  SubQTUseCase({required this.repository});
  Future<ResponseModel> call({required String itemId}) async {
    return BaseUseCaseCall.onGetData<dynamic>( await repository.subQT(itemId: itemId), onConvert,tag: 'SubQTUseCase');
  }

  @override
  ResponseModel<dynamic> onConvert(BaseModel baseModel) {
    try{
      return ResponseModel(true, baseModel.message,data: baseModel.responseData);
    }catch(e){
      return ResponseModel(true, baseModel.message,data: baseModel.responseData);
    }
  }
}
