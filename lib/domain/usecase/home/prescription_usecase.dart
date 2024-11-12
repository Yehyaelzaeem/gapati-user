
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/home_model.dart';
import '../../../data/model/response/home_params.dart';
import '../../../data/model/response/profile_model.dart';
import '../../../data/model/response/restaurants_nearst_model.dart';
import '../../repository/home_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class RestaurantsUseCase implements BaseUseCase<RestaurantsNearestModel>{
  final HomeRepository repository;
  RestaurantsUseCase({required this.repository});
  Future<ResponseModel> call(HomeParams params) async {
    return BaseUseCaseCall.onGetData<RestaurantsNearestModel>( await repository.getRestaurantsNearest(params), onConvert,tag: 'RestaurantsUseCase');
  }

  @override
  ResponseModel<RestaurantsNearestModel> onConvert(BaseModel baseModel) {
    try{
      RestaurantsNearestModel? homeModel = RestaurantsNearestModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true, baseModel.message,data: homeModel);
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
