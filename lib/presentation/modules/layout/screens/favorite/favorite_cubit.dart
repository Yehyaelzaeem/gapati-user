import 'package:cogina/core/helpers/toast_states/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/model/base/response_model.dart';
import '../../../../../data/model/response/favorite_model.dart';
import '../../../../../domain/usecase/favorite/add_favorite_usecase.dart';
import '../../../../../domain/usecase/favorite/get_favorite_usecase.dart';
import '../../../../../domain/usecase/favorite/remove_favorite_usecase.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final GetFavoriteUseCase _getFavoriteUseCase;
  final AddFavoriteUseCase _addFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  FavoriteCubit({required GetFavoriteUseCase getFavoriteUseCase ,required AddFavoriteUseCase addFavoriteUseCase,
   required RemoveFavoriteUseCase removeFavoriteUseCase}) :_getFavoriteUseCase=getFavoriteUseCase,_addFavoriteUseCase=addFavoriteUseCase,
        _removeFavoriteUseCase=removeFavoriteUseCase, super(FavoriteInitial());

  static FavoriteCubit get(BuildContext context)=>BlocProvider.of(context);
  FavoriteModel? favoriteModel;

  Future<ResponseModel?> getFavorite(context) async {
      emit(GetFavoriteLoadingState()) ;
      ResponseModel responseModel = await _getFavoriteUseCase.call();
      if (responseModel.isSuccess) {
        favoriteModel =responseModel.data;
        emit(GetFavoriteSuccessState()) ;
      }else{
        emit(GetFavoriteErrorState()) ;
      }
      return responseModel;
  }

  Future<ResponseModel?> addFavorite({required int itemId,required BuildContext context}) async {
      emit(GetFavoriteLoadingState()) ;
      ResponseModel responseModel = await _addFavoriteUseCase.call(itemId: itemId);
      if (responseModel.isSuccess) {
        getFavorite(context);
        showToast(text: responseModel.message!, state: ToastStates.success, context: context);
        emit(GetFavoriteSuccessState()) ;
      }else{
        emit(GetFavoriteErrorState()) ;
      }
      return responseModel;
  }
  Future<ResponseModel?> removeFavorite({required int itemId,required BuildContext context}) async {
      emit(GetFavoriteLoadingState()) ;
      ResponseModel responseModel = await _removeFavoriteUseCase.call(itemId: itemId);
      if (responseModel.isSuccess) {
        getFavorite(context);
        showToast(text: responseModel.message!, state: ToastStates.success, context: context);
        emit(GetFavoriteSuccessState()) ;
      }else{
        emit(GetFavoriteErrorState()) ;
      }
      return responseModel;
  }

}
