import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/delivery_fees_params.dart';
import '../../../data/model/response/favorite_model.dart';
import '../../../data/model/response/home_model.dart';
import '../../../data/model/response/restaurants_nearst_model.dart';
import '../../repository/check_out_repo.dart';
import '../../repository/favorite_repo.dart';
import '../../request_body/check_out_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class GetDeliveryFeesUseCase implements BaseUseCase<dynamic>{
  final CheckOutRepository repository;
  GetDeliveryFeesUseCase({required this.repository});
  Future<ResponseModel> call({required DeliveryFeesParams params}) async {
    return BaseUseCaseCall.onGetData<dynamic>( await repository.getDeliveryFees(params: params), onConvert,tag: 'GetDeliveryFeesUseCase');
  }
  @override
  ResponseModel<dynamic> onConvert(BaseModel baseModel) {
    dynamic result =baseModel.responseData['price'];
    try{

      return ResponseModel(baseModel.status??true , baseModel.message,data: result);
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
