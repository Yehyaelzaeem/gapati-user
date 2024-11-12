
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/accept_prescriptoin_params.dart';
import '../../../data/model/response/home_model.dart';
import '../../../data/model/response/home_params.dart';
import '../../../data/model/response/prescription_params.dart';
import '../../../data/model/response/profile_model.dart';
import '../../../data/model/response/restaurants_nearst_model.dart';
import '../../repository/home_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class AcceptPrescriptionUseCase implements BaseUseCase<dynamic>{
  final HomeRepository repository;
  AcceptPrescriptionUseCase({required this.repository});
  Future<ResponseModel> call({required AcceptPrescriptionParams params}) async {
    return BaseUseCaseCall.onGetData<dynamic>( await repository.acceptPrescription(params: params), onConvert,tag: 'AcceptPrescriptionUseCase');
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
