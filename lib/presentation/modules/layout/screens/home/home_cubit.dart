import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../data/model/base/response_model.dart';
import '../../../../../data/model/response/home_model.dart';
import '../../../../../data/model/response/offers_model.dart';
import '../../../../../data/model/response/restaurants_nearst_model.dart';
import '../../../../../domain/usecase/home/home_usecase.dart';
import '../../../../../domain/usecase/home/offers_usecase.dart';
import '../../../../../domain/usecase/home/resturants_usecase.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required HomeUseCase homeUseCase,required RestaurantsUseCase restaurantsUseCase,
    required OffersUseCase offersUseCase}) :
        _offersUseCase=offersUseCase,
        _restaurantsUseCase=restaurantsUseCase,
        _homeUseCase =homeUseCase, super(HomeInitial()){
    getHome();
  }
  final RestaurantsUseCase _restaurantsUseCase;
  final HomeUseCase _homeUseCase;
  final OffersUseCase _offersUseCase;
  static HomeCubit get(BuildContext context)=>BlocProvider.of(context);

  HomeModel? homeModel;
  RestaurantsNearestModel? restaurantsNearestModel;
  List<RestaurantsNearestModelData>? restaurantList;
  List<DataHome>? listDatas;
  OffersModel? offersModel;
  List<OffersModelData>? offerList;
  String? token;
  void getToken({String? tk}){
    token=tk!;
    emit(GetTokenState());
  }
  Future<ResponseModel?> getHome() async {
    // listData=null;
    // emit(HomeLoadingState()) ;
    // ResponseModel responseModel = await _homeUseCase.call();
    // if (responseModel.isSuccess) {
    //    homeModel =responseModel.data;
    //    listData=homeModel!.data!.data!;
    //   emit(HomeSuccessState()) ;
    // }else{
    //   emit(HomeErrorState()) ;
    // }
    // return responseModel;
  }
  Future<ResponseModel> getRestaurantNearest(LatLng latLng) async {
    restaurantList=null;
    emit(GetRestaurantLoadingState()) ;
    ResponseModel responseModel = await _restaurantsUseCase.call(latLng);
    if (responseModel.isSuccess) {
      restaurantsNearestModel =responseModel.data;
      restaurantList =restaurantsNearestModel!.data!;
      emit(GetRestaurantSuccessState()) ;
    }else{
      emit(GetRestaurantErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> getOffers({bool? isDoNull}) async {
    isDoNull==true?
    offerList=null:null;
    emit(OffersLoadingState()) ;
    ResponseModel responseModel = await _offersUseCase.call();
    if (responseModel.isSuccess) {
      offersModel =responseModel.data;
      offerList=offersModel!.data!;
      emit(OffersSuccessState()) ;
    }else{
      emit(OffersErrorState()) ;
    }
    return responseModel;
  }

}
