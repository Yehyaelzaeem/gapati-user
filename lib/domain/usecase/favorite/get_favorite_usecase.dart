import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/favorite_model.dart';
import '../../repository/favorite_repo.dart';
import '../../request_body/check_out_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class GetFavoriteUseCase implements BaseUseCase<FavoriteModel>{
  final FavoriteRepository repository;
  GetFavoriteUseCase({required this.repository});
  Future<ResponseModel> call() async {
    return BaseUseCaseCall.onGetData<FavoriteModel>( await repository.getFavorite(), onConvert,tag: 'GetFavoriteUseCase');
  }
  @override
  ResponseModel<FavoriteModel> onConvert(BaseModel baseModel) {
    try{
      FavoriteModel favoriteModel =FavoriteModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true , baseModel.message,data: favoriteModel);
    }catch(e){
      FavoriteModel favoriteModel =FavoriteModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??false, baseModel.message,data: favoriteModel);
    }
  }
}
