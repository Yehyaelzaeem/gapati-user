import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/search_model.dart';
import '../../repository/search_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class SearchUseCase implements BaseUseCase<SearchModel>{
  final SearchRepository repository;
  SearchUseCase({required this.repository});
  Future<ResponseModel> call({required String searchText}) async {
    return BaseUseCaseCall.onGetData<SearchModel>( await repository.search(searchText: searchText), onConvert,tag: 'SearchUseCase');
  }

  @override
  ResponseModel<SearchModel> onConvert(BaseModel baseModel) {
    try{
      if(baseModel.code =='200' ||baseModel.code =='201'){
        SearchModel searchModel =SearchModel.fromJson(baseModel.responseData);
        return ResponseModel(baseModel.status??true, baseModel.message,data: searchModel);
      }else{
        return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
      }
    }catch(e){
      return ResponseModel(baseModel.status??false, baseModel.message,data: baseModel.responseData);
    }
  }
}
