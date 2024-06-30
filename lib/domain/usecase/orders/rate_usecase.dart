import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/order_details_model.dart';
import '../../../data/model/response/order_model.dart';
import '../../repository/orders_repo.dart';
import '../../request_body/rate_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class RateUseCase implements BaseUseCase<dynamic>{
  final OrdersRepository repository;
  RateUseCase({required this.repository});
  Future<ResponseModel> call({required RateBody rateBody}) async {
    return BaseUseCaseCall.onGetData<dynamic>( await repository.rateOrder(rateBody: rateBody), onConvert,tag: 'RateUseCase');
  }

  @override
  ResponseModel<dynamic> onConvert(BaseModel baseModel) {
    try{
      if(baseModel.code =='200' ||baseModel.code =='201'){
        return ResponseModel(baseModel.status??true, baseModel.message,data: baseModel.responseData);
      }else{
        return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
      }    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
