import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../repository/favorite_repo.dart';
import '../../request_body/check_out_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class AddFavoriteRestaurantUseCase implements BaseUseCase<dynamic>{
  final FavoriteRepository repository;
  AddFavoriteRestaurantUseCase({required this.repository});
  Future<ResponseModel> call({required int restaurantId}) async {
    return BaseUseCaseCall.onGetData<dynamic>( await repository.addFavoriteRestaurant(restaurantId: restaurantId), onConvert,tag: 'AddFavoriteUseCase');
  }
  @override
  ResponseModel<dynamic> onConvert(BaseModel baseModel) {

    try{
      if(baseModel.code =='200' ||baseModel.code =='201'){
        return ResponseModel(baseModel.status??true, baseModel.message,data: baseModel.responseData);
      }else{
        return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
      }
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
