import 'package:cogina/domain/logger.dart';

import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/home_model.dart';
import '../../../data/model/response/profile_model.dart';
import '../../repository/home_repo.dart';
import '../../repository/profile_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class HomeUseCase implements BaseUseCase<HomeModel>{
  final HomeRepository repository;
  HomeUseCase({required this.repository});
  Future<ResponseModel> call() async {
    return BaseUseCaseCall.onGetData<HomeModel>( await repository.getHome(), onConvert,tag: 'HomeUseCase');
  }

  @override
  ResponseModel<HomeModel> onConvert(BaseModel baseModel) {
    try{
      HomeModel? homeModel = HomeModel.fromJson(baseModel.responseData);
      return ResponseModel(true, baseModel.message,data: homeModel);
    }catch(e){
      return ResponseModel(true, baseModel.message,data: baseModel.responseData);
    }
  }
}
