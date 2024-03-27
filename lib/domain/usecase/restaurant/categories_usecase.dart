import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/categories_model.dart';
import '../../repository/restaurant_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class CategoriesUseCase implements BaseUseCase<CategoriesModel>{
  final RestaurantRepository repository;
  CategoriesUseCase({required this.repository});
  Future<ResponseModel> call({required int id}) async {
    return BaseUseCaseCall.onGetData<CategoriesModel>( await repository.getCategories(id: id), onConvert,tag: 'CategoriesUseCase');
  }

  @override
  ResponseModel<CategoriesModel> onConvert(BaseModel baseModel) {
    CategoriesModel? categoriesModel = CategoriesModel.fromJson(baseModel.categories);
    try{
      return ResponseModel(true, baseModel.message,data: categoriesModel);
    }catch(e){
      return ResponseModel(true, baseModel.message,data: categoriesModel);
    }
  }
}
