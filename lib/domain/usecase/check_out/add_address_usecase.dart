// import '../../../data/model/base/base_model.dart';
// import '../../../data/model/base/response_model.dart';
// import '../../repository/check_out_repo.dart';
// import '../../request_body/address_body.dart';
// import '../base_usecase/base_use_case_call.dart';
// import '../base_usecase/base_usecase.dart';
//
//
// class AddAddressUseCase implements BaseUseCase<dynamic>{
//   final CheckOutRepository repository;
//   AddAddressUseCase({required this.repository});
//   Future<ResponseModel> call({required AddressBody addressBody}) async {
//     return BaseUseCaseCall.onGetData<dynamic>( await repository.addMainAddress(addressBody: addressBody), onConvert,tag: 'AddAddressUseCase');
//   }
//
//   @override
//   ResponseModel<dynamic> onConvert(BaseModel baseModel) {
//     try{
//       return ResponseModel(baseModel.status??true, baseModel.message,data: baseModel.responseData);
//     }catch(e){
//       return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
//     }
//   }
// }
