import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../repository/address_repo.dart';
import '../../request_body/address_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class UpdateAddressUseCase implements BaseUseCase<dynamic>{
  final AddressRepository repository;
  UpdateAddressUseCase({required this.repository});
  Future<ResponseModel> call({required AddressBody addressBody,required int addressId}) async {
    return BaseUseCaseCall.onGetData<dynamic>( await repository.updateAddress(addressBody: addressBody,addressId:addressId), onConvert,tag: 'UpdateAddressUseCase');
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
