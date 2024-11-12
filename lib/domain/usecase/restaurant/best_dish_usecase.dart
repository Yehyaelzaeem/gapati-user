import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/best_dish_model.dart';
import '../../../data/model/response/categories_model.dart';
import '../../repository/restaurant_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class BestDishUseCase implements BaseUseCase<BestDishModel>{
  final RestaurantRepository repository;
  BestDishUseCase({required this.repository});
  Future<ResponseModel> call({required int id}) async {
    return BaseUseCaseCall.onGetData<BestDishModel>( await repository.getBestDishes(id: id), onConvert,tag: 'BestDishUseCase');
  }

  @override
  ResponseModel<BestDishModel> onConvert(BaseModel baseModel) {
    BestDishModel? bestDishModel = BestDishModel.fromJson(baseModel.responseData);

    try{
      return ResponseModel(baseModel.status??true, baseModel.message,data: bestDishModel);
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: bestDishModel);
    }
  }
}
