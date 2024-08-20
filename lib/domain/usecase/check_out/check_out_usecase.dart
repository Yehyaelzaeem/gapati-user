
import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/cart_model.dart';
import '../../../data/model/response/main_address_model.dart';
import '../../repository/cart_repo.dart';
import '../../repository/check_out_repo.dart';
import '../../request_body/address_body.dart';
import '../../request_body/check_out_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class CheckOutUseCase implements BaseUseCase<dynamic>{
  final CheckOutRepository repository;
  CheckOutUseCase({required this.repository});
  Future<ResponseModel> call({required CheckOutModel checkOutBody}) async {
    return BaseUseCaseCall.onGetData<dynamic>( await repository.checkOut(checkOutBody: checkOutBody), onConvert,tag: 'CheckOutUseCase');
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
