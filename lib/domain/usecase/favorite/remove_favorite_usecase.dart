import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../repository/favorite_repo.dart';
import '../../request_body/check_out_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class RemoveFavoriteUseCase implements BaseUseCase<dynamic>{
  final FavoriteRepository repository;
  RemoveFavoriteUseCase({required this.repository});
  Future<ResponseModel> call({required int itemId}) async {
    return BaseUseCaseCall.onGetData<dynamic>( await repository.removeFavorite(itemId: itemId), onConvert,tag: 'RemoveFavoriteUseCase');
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
