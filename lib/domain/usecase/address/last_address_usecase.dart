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
      LastAddressModel? lastAddressModel = LastAddressModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true, baseModel.message,data: lastAddressModel);
    }catch(e){
      LastAddressModel? lastAddressModel = LastAddressModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??false, baseModel.message,data: lastAddressModel);
    }
  }
}
