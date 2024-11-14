
import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/banner_model.dart';
import '../../../data/model/response/categories_model.dart';
import '../../../data/model/response/home_model.dart';
import '../../repository/home_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class HomeCategoriesUseCase implements BaseUseCase<CategoriesModel>{
  final HomeRepository repository;
  HomeCategoriesUseCase({required this.repository});
  Future<ResponseModel> call() async {
    return BaseUseCaseCall.onGetData<CategoriesModel>( await repository.getCategories(), onConvert,tag: 'HomeCategoriesUseCase');
  }

  @override
  ResponseModel<CategoriesModel> onConvert(BaseModel baseModel) {
    try{
      CategoriesModel? categoriesModel = CategoriesModel.fromJson(baseModel.categories);
      return ResponseModel(baseModel.status??true, baseModel.message,data: categoriesModel);
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
