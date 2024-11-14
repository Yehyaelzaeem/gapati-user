import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/delivery_fees_params.dart';
import '../../../data/model/response/favorite_model.dart';
import '../../../data/model/response/home_model.dart';
import '../../../data/model/response/nearest_branch_model.dart';
import '../../../data/model/response/restaurants_nearst_model.dart';
import '../../repository/check_out_repo.dart';
import '../../repository/favorite_repo.dart';
import '../../request_body/check_out_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class GetNearestBranchUseCase implements BaseUseCase<NearestBranchModel>{
  final CheckOutRepository repository;
  GetNearestBranchUseCase({required this.repository});
  Future<ResponseModel> call({required LatLng latLng}) async {
    return BaseUseCaseCall.onGetData<NearestBranchModel>( await repository.getNearestBranch(latLng: latLng), onConvert,tag: 'GetNearestBranchUseCase');
  }
  @override
  ResponseModel<NearestBranchModel> onConvert(BaseModel baseModel) {
    try{
      NearestBranchModel result = NearestBranchModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true , baseModel.message,data: result);
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
