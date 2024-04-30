import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/search_model.dart';
import '../../../domain/usecase/search/search_usecase.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase _searchUseCase;
  SearchCubit({required SearchUseCase searchUseCase }) :_searchUseCase=searchUseCase, super(SearchInitial());
  static SearchCubit get(BuildContext context)=>BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
  SearchModel? searchModel;
  SearchModelData? searchModelData;
  Future<ResponseModel?> getSearch({required String searchText}) async {
    emit(GetSearchLoadingState()) ;
    ResponseModel responseModel = await _searchUseCase.call(searchText: searchText);
    if (responseModel.isSuccess) {
      searchModel =responseModel.data;
      emit(GetSearchSuccessState()) ;
    }else{
      emit(GetSearchErrorState()) ;
    }
    return responseModel;
  }



  bool isSearchStart=false;
  void changeSearchStart(bool x){
    isSearchStart=x;
    emit(ChangeLoadingState());
  }
}
