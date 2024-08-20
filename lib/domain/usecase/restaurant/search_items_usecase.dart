
import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/categories_model.dart';
import '../../../data/model/response/category_all_items_model.dart';
import '../../../data/model/response/category_item_model.dart';
import '../../../data/model/response/search_item_model.dart';
import '../../repository/restaurant_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class SearchItemsUseCase implements BaseUseCase<SearchItemModel>{
  final RestaurantRepository repository;
  SearchItemsUseCase({required this.repository});
  Future<ResponseModel> call({required String  searchText,required int storeId,}) async {
    return BaseUseCaseCall.onGetData<SearchItemModel>( await repository.searchItem( storeId: storeId, searchText: searchText), onConvert,tag: 'SearchItemUseCase');
  }

  @override
  ResponseModel<SearchItemModel> onConvert(BaseModel baseModel) {
    try{
      SearchItemModel searchItemModel = SearchItemModel.fromJson(baseModel.responseData);

      return ResponseModel(baseModel.status??true, baseModel.message,data: searchItemModel);
    }catch(e){
      SearchItemModel searchItemModel = SearchItemModel.fromJson(baseModel.responseData);

      return ResponseModel(baseModel.status??false, baseModel.message,data: searchItemModel);
    }
  }
}
