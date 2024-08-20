
import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/categories_model.dart';
import '../../../data/model/response/category_all_items_model.dart';
import '../../../data/model/response/category_item_model.dart';
import '../../repository/restaurant_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class CategoryItemsUseCase implements BaseUseCase<CategoryItemModel>{
  final RestaurantRepository repository;
  CategoryItemsUseCase({required this.repository});
  Future<ResponseModel> call({required int categoryId,required int storeId,}) async {
    return BaseUseCaseCall.onGetData<CategoryItemModel>( await repository.getCategoriesItems(categoryId: categoryId, storeId: storeId), onConvert,tag: 'CategoriesUseCase');
  }

  @override
  ResponseModel<CategoryItemModel> onConvert(BaseModel baseModel) {
    CategoryItemModel? categoriesModel = CategoryItemModel.fromJson(baseModel.responseData);
    try{
      return ResponseModel(baseModel.status??true, baseModel.message,data: categoriesModel);
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: categoriesModel);
    }
  }
}
