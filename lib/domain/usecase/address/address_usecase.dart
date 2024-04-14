import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/address_model.dart';
import '../../../data/model/response/cart_model.dart';
import '../../../data/model/response/main_address_model.dart';
import '../../repository/address_repo.dart';
import '../../repository/cart_repo.dart';
import '../../repository/check_out_repo.dart';
import '../../request_body/address_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class AddressUseCase implements BaseUseCase<AddressModel>{
  final AddressRepository repository;
  AddressUseCase({required this.repository});
  Future<ResponseModel> call() async {
    return BaseUseCaseCall.onGetData<AddressModel>( await repository.getAllAddress(), onConvert,tag: 'GetAllAddressUseCase');
  }

  @override
  ResponseModel<AddressModel> onConvert(BaseModel baseModel) {
    try{
      AddressModel addressModel =AddressModel.fromJson(baseModel.responseData);
      if(baseModel.code =='200' ||baseModel.code =='201'){
        return ResponseModel(baseModel.status??true, baseModel.message,data: addressModel );
      }else{

        return ResponseModel(baseModel.status??false, baseModel.message,data:addressModel);
      }
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
