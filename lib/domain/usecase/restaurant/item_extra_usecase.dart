import 'package:cogina/domain/logger.dart';

import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/categories_model.dart';
import '../../../data/model/response/category_all_items_model.dart';
import '../../../data/model/response/category_item_model.dart';
import '../../../data/model/response/iitem_extra_model.dart';
import '../../repository/restaurant_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class ItemExtraUseCase implements BaseUseCase<ItemExtraModel>{
  final RestaurantRepository repository;
  ItemExtraUseCase({required this.repository});
  Future<ResponseModel> call({required int itemId}) async {
    return BaseUseCaseCall.onGetData<ItemExtraModel>( await repository.getItemsExtra(itemId: itemId), onConvert,tag: 'ExtraUseCase');
  }

  @override
  ResponseModel<ItemExtraModel> onConvert(BaseModel baseModel) {
    ItemExtraModel? itemExtraModel = ItemExtraModel.fromJson(baseModel.extra);
    try{
      return ResponseModel(true, baseModel.message,data: itemExtraModel);
    }catch(e){
      return ResponseModel(true, baseModel.message,data: itemExtraModel);
    }
  }
}
