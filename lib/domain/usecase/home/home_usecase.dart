
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/home_model.dart';
import '../../../data/model/response/home_params.dart';
import '../../repository/home_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class HomeUseCase implements BaseUseCase<HomeModel>{
  final HomeRepository repository;
  HomeUseCase({required this.repository});
  Future<ResponseModel> call({required HomeParams params}) async {
    return BaseUseCaseCall.onGetData<HomeModel>( await repository.getHome(params: params), onConvert,tag: 'HomeUseCase');
  }

  @override
  ResponseModel<HomeModel> onConvert(BaseModel baseModel) {
    HomeModel? homeModel = HomeModel.fromJson(baseModel.responseData);

    try{
      return ResponseModel(baseModel.status??true, baseModel.message,data: homeModel);
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
