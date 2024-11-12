import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/favorite_model.dart';
import '../../../data/model/response/home_model.dart';
import '../../../data/model/response/restaurants_nearst_model.dart';
import '../../repository/favorite_repo.dart';
import '../../request_body/check_out_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class GetFavoriteRestaurantUseCase implements BaseUseCase<RestaurantsNearestModel>{
  final FavoriteRepository repository;
  GetFavoriteRestaurantUseCase({required this.repository});
  Future<ResponseModel> call() async {
    return BaseUseCaseCall.onGetData<RestaurantsNearestModel>( await repository.getFavoriteRestaurant(), onConvert,tag: 'GetFavoriteUseCase');
  }
  @override
  ResponseModel<RestaurantsNearestModel> onConvert(BaseModel baseModel) {
    try{
      RestaurantsNearestModel favoriteModel =RestaurantsNearestModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true , baseModel.message,data: favoriteModel);
    }catch(e){
      RestaurantsNearestModel favoriteModel =RestaurantsNearestModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??false, baseModel.message,data: favoriteModel);
    }
  }
}
