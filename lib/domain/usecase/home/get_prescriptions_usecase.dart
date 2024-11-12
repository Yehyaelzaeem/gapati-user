
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/home_model.dart';
import '../../../data/model/response/home_params.dart';
import '../../../data/model/response/prescription_params.dart';
import '../../../data/model/response/prescriptions_model.dart';
import '../../../data/model/response/profile_model.dart';
import '../../../data/model/response/restaurants_nearst_model.dart';
import '../../repository/home_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class GetPrescriptionsUseCase implements BaseUseCase<PrescriptionsModel>{
  final HomeRepository repository;
  GetPrescriptionsUseCase({required this.repository});
  Future<ResponseModel> call() async {
    return BaseUseCaseCall.onGetData<PrescriptionsModel>( await repository.getPrescriptions(), onConvert,tag: 'GetPrescriptionsUseCase');
  }

  @override
  ResponseModel<PrescriptionsModel> onConvert(BaseModel baseModel) {
    try{
      PrescriptionsModel prescriptionsModel = PrescriptionsModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true, baseModel.message,data: prescriptionsModel);
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
