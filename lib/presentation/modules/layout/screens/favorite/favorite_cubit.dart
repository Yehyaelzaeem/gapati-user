import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/toast_states/enums.dart';
import '../../../../../data/model/base/response_model.dart';
import '../../../../../data/model/response/favorite_model.dart';
import '../../../../../data/model/response/home_model.dart';
import '../../../../../data/model/response/restaurants_nearst_model.dart';
import '../../../../../domain/usecase/favorite/add_favorite_restaurant_usecase.dart';
import '../../../../../domain/usecase/favorite/add_favorite_usecase.dart';
import '../../../../../domain/usecase/favorite/get_favorite_resataurant_usecase.dart';
import '../../../../../domain/usecase/favorite/get_favorite_usecase.dart';
import '../../../../../domain/usecase/favorite/remove_favorite_restaurant_usecase.dart';
import '../../../../../domain/usecase/favorite/remove_favorite_usecase.dart';
import '../home/home_cubit.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final GetFavoriteUseCase _getFavoriteUseCase;
  final AddFavoriteUseCase _addFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  final GetFavoriteRestaurantUseCase _getFavoriteRestaurantUseCase;
  final AddFavoriteRestaurantUseCase _addFavoriteRestaurantUseCase;
  final RemoveFavoriteRestaurantUseCase _removeFavoriteRestaurantUseCase;
  FavoriteCubit({
    required GetFavoriteUseCase getFavoriteUseCase ,
    required AddFavoriteUseCase addFavoriteUseCase,
   required RemoveFavoriteUseCase removeFavoriteUseCase,
    required GetFavoriteRestaurantUseCase getFavoriteRestaurantUseCase ,
    required AddFavoriteRestaurantUseCase addFavoriteRestaurantUseCase,
   required RemoveFavoriteRestaurantUseCase removeFavoriteRestaurantUseCase,
  }) :  _getFavoriteUseCase=getFavoriteUseCase,
        _addFavoriteUseCase=addFavoriteUseCase,
        _removeFavoriteUseCase=removeFavoriteUseCase,
        _getFavoriteRestaurantUseCase=getFavoriteRestaurantUseCase,
        _addFavoriteRestaurantUseCase=addFavoriteRestaurantUseCase,
        _removeFavoriteRestaurantUseCase=removeFavoriteRestaurantUseCase,
        super(FavoriteInitial());

  static FavoriteCubit get(BuildContext context)=>BlocProvider.of(context);
  FavoriteModel? favoriteModel;
  List<RestaurantsNearestModelData>? favoriteRestaurantModel;
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
  Future<ResponseModel?> getFavoriteRestaurant(context) async {
      emit(GetFavoriteLoadingState()) ;
      ResponseModel responseModel = await _getFavoriteRestaurantUseCase.call();
      if (responseModel.isSuccess) {
        favoriteRestaurantModel =responseModel.data;
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
  Future<ResponseModel?> addFavoriteRestaurant({required int restaurantId,required BuildContext context}) async {
      emit(GetFavoriteLoadingState()) ;
      ResponseModel responseModel = await _addFavoriteRestaurantUseCase.call(restaurantId: restaurantId);
      if (responseModel.isSuccess) {
        getFavoriteRestaurant(context);
        HomeCubit.get(context).getHome();
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
        HomeCubit.get(context).getHome();
        showToast(text: responseModel.message!, state: ToastStates.success, context: context);
        emit(GetFavoriteSuccessState()) ;
      }else{
        emit(GetFavoriteErrorState()) ;
      }
      return responseModel;
  }
  Future<ResponseModel?> removeFavoriteRestaurant({required int restaurantId,required BuildContext context}) async {
      emit(GetFavoriteLoadingState()) ;
      ResponseModel responseModel = await _removeFavoriteRestaurantUseCase.call(restaurantId: restaurantId);
      if (responseModel.isSuccess) {
        getFavoriteRestaurant(context);
        showToast(text: responseModel.message!, state: ToastStates.success, context: context);
        emit(GetFavoriteSuccessState()) ;
      }else{
        emit(GetFavoriteErrorState()) ;
      }
      return responseModel;
  }

}
