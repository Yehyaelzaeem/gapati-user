import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/main_address_model.dart';
import '../../repository/address_repo.dart';
import '../../repository/check_out_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class MainAddressUseCase implements BaseUseCase<MainAddressModel>{
  final AddressRepository repository;
  MainAddressUseCase({required this.repository});
  Future<ResponseModel> call() async {
    return BaseUseCaseCall.onGetData<MainAddressModel>( await repository.getMainAddress(), onConvert,tag: 'MainAddressUseCase');
  }

  @override
  ResponseModel<MainAddressModel> onConvert(BaseModel baseModel) {
    try{
      MainAddressModel? mainAddressModel = MainAddressModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true, baseModel.message,data: mainAddressModel);
    }catch(e){
      MainAddressModel? mainAddressModel = MainAddressModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??false, baseModel.message,data: mainAddressModel);
    }
  }
}
