import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/categories_model.dart';
import '../../../data/model/response/category_all_items_model.dart';
import '../../../data/model/response/category_item_model.dart';
import '../../../data/model/response/item_extra_model.dart';
import '../../../data/model/response/search_item_model.dart';
import '../../../domain/usecase/restaurant/categories_usecase.dart';
import '../../../domain/usecase/restaurant/category_items_usecase.dart';
import '../../../domain/usecase/restaurant/item_extra_usecase.dart';
import '../../../domain/usecase/restaurant/search_items_usecase.dart';
part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit({required SearchItemsUseCase searchItemsUseCase,required ItemExtraUseCase itemExtraUseCase,required CategoriesUseCase categoriesUseCase,required CategoryItemsUseCase categoryItemsUseCase}) :
       _searchItemsUseCase=searchItemsUseCase, _categoriesUseCase = categoriesUseCase,_categoryItemsUseCase=categoryItemsUseCase ,_itemExtraUseCase=itemExtraUseCase ,super(RestaurantInitial());

  final SearchItemsUseCase _searchItemsUseCase;
  final CategoriesUseCase _categoriesUseCase;
  final ItemExtraUseCase _itemExtraUseCase;
  final CategoryItemsUseCase _categoryItemsUseCase;
  static RestaurantCubit get(BuildContext context)=>BlocProvider.of(context);

  List<CategoriesModelData>? categoriesModelList;
  List<CategoryItemsData>? categoryItemsModelList;
  List<ItemExtraModelData>? itemExtraModelDataList;

  Future<ResponseModel> getCategories({required int id}) async {
     categoriesModelList=null;
    emit(GetCategoriesLoadingState()) ;
    ResponseModel responseModel = await _categoriesUseCase.call(id: id);
    if (responseModel.isSuccess) {
      CategoriesModel categoriesModel =responseModel.data;
      categoriesModelList=categoriesModel.data!;
      emit(GetCategoriesSuccessState()) ;
    }else{
      emit(GetCategoriesErrorState()) ;
    }
    return responseModel;
  }
  SearchItemModel? searchItemModel;
  Future<ResponseModel> searchItems({required int storeId,required String searchText}) async {
    emit(SearchLoadingState()) ;
    ResponseModel responseModel = await _searchItemsUseCase.call(searchText: searchText, storeId: storeId);
    if (responseModel.isSuccess) {
       searchItemModel =responseModel.data;
      emit(SearchSuccessState()) ;
    }else{
      emit(SearchErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> getItemExtra({required int id}) async {
    itemExtraModelDataList=null;
    emit(GetCategoriesLoadingState()) ;
    ResponseModel responseModel = await _itemExtraUseCase.call(itemId: id);
    if (responseModel.isSuccess) {
      ItemExtraModel itemExtraModel =responseModel.data;
      itemExtraModelDataList=itemExtraModel.data!;
      emit(GetCategoriesSuccessState()) ;
    }else{
      emit(GetCategoriesErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> getCategoryItems({required int categoryId,required int storeId,bool? notNull}) async {
    notNull!=true?
    categoryItemsModelList=null:
    null;
    emit(GetCategoriesLoadingState()) ;
    ResponseModel responseModel = await _categoryItemsUseCase.call(categoryId: categoryId, storeId: storeId);
    if (responseModel.isSuccess) {
      CategoryItemModel categoriesItemsModel =responseModel.data;
      categoryItemsModelList=categoriesItemsModel.data!.categoryItems!.data!;
      emit(GetCategoriesSuccessState()) ;
    }else{
      emit(GetCategoriesErrorState()) ;
    }
    return responseModel;
  }
  TextEditingController searchController = TextEditingController();
  bool isSearchStart=false;
  void changeSearchStart(bool x){
    isSearchStart=x;
    emit(ChangeLoadingState());
  }

}
