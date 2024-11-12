import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../repository/address_repo.dart';
import '../../request_body/address_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class AddAddressUseCase implements BaseUseCase<int>{
  final AddressRepository repository;
  AddAddressUseCase({required this.repository});
  Future<ResponseModel> call({required AddressBody addressBody}) async {
    return BaseUseCaseCall.onGetData<int>( await repository.addAddress(addressBody: addressBody), onConvert,tag: 'AddAddressUseCase');
  }

  @override
  ResponseModel<int> onConvert(BaseModel baseModel) {
    int id=baseModel.responseData['data']['id'];

    try{
      if(baseModel.code =='200' ||baseModel.code =='201'){
        return ResponseModel(baseModel.status??true, baseModel.message,data:id);
      }else{
        return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
      }
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }

  }
}
