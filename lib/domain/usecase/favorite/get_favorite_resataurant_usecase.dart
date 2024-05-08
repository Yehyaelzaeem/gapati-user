import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/favorite_model.dart';
import '../../../data/model/response/home_model.dart';
import '../../repository/favorite_repo.dart';
import '../../request_body/check_out_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class GetFavoriteRestaurantUseCase implements BaseUseCase<HomeModelData>{
  final FavoriteRepository repository;
  GetFavoriteRestaurantUseCase({required this.repository});
  Future<ResponseModel> call() async {
    return BaseUseCaseCall.onGetData<HomeModelData>( await repository.getFavoriteRestaurant(), onConvert,tag: 'GetFavoriteUseCase');
  }
  @override
  ResponseModel<HomeModelData> onConvert(BaseModel baseModel) {
    try{
      HomeModelData favoriteModel =HomeModelData.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true , baseModel.message,data: favoriteModel);
    }catch(e){
      HomeModelData favoriteModel =HomeModelData.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??false, baseModel.message,data: favoriteModel);
    }
  }
}
