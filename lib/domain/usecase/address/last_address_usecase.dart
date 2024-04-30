import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/last_address_model.dart';
import '../../repository/address_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class LastAddressUseCase implements BaseUseCase<LastAddressModel>{
  final AddressRepository repository;
  LastAddressUseCase({required this.repository});
  Future<ResponseModel> call() async {
    return BaseUseCaseCall.onGetData<LastAddressModel>( await repository.getLastAddress(), onConvert,tag: 'MainAddressUseCase');
  }

  @override
  ResponseModel<LastAddressModel> onConvert(BaseModel baseModel) {
    try{
      if(baseModel.code =='200' ||baseModel.code =='201'){
          LastAddressModel lastAddressModel = LastAddressModel.fromJson(baseModel.responseData);
        return ResponseModel(baseModel.status??true, baseModel.message,data: lastAddressModel);
      }else{
        return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
      }
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
