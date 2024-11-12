import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../data/model/base/response_model.dart';
import '../../../../../data/model/response/banner_model.dart';
import '../../../../../data/model/response/home_model.dart';
import '../../../../../data/model/response/home_params.dart';
import '../../../../../data/model/response/offers_model.dart';
import '../../../../../data/model/response/restaurants_nearst_model.dart';
import '../../../../../data/model/response/store_types_model.dart';
import '../../../../../data/model/response/stores_model.dart';
import '../../../../../domain/usecase/home/banner_usecase.dart';
import '../../../../../domain/usecase/home/get_stores_usecase.dart';
import '../../../../../domain/usecase/home/home_usecase.dart';
import '../../../../../domain/usecase/home/offers_usecase.dart';
import '../../../../../domain/usecase/home/resturants_usecase.dart';
import '../../../../../domain/usecase/home/store_types_usecase.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RestaurantsUseCase _restaurantsUseCase;
  final HomeUseCase _homeUseCase;
  final GetStoresUseCase _getStoresUseCase;
  final BannerUseCase _bannerUseCase;
  final StoreTypesUseCase _storeTypesUseCase;
  final OffersUseCase _offersUseCase;
  HomeCubit({
    required HomeUseCase homeUseCase,
    required RestaurantsUseCase restaurantsUseCase,
    required GetStoresUseCase getStoresUseCase,
    required StoreTypesUseCase storeTypesUseCase,
    required BannerUseCase bannerUseCase,
    required OffersUseCase offersUseCase
  }) :
        _storeTypesUseCase=storeTypesUseCase,
        _bannerUseCase=bannerUseCase,
        _offersUseCase=offersUseCase,
        _restaurantsUseCase=restaurantsUseCase,
        _getStoresUseCase=getStoresUseCase,
        _homeUseCase =homeUseCase, super(HomeInitial()){
  }
  static HomeCubit get(BuildContext context)=>BlocProvider.of(context);

  HomeModel? homeModel;
  RestaurantsNearestModel? restaurantsNearestModel;
  List<RestaurantsNearestModelData>? restaurantList;
  OffersModel? offersModel;
  List<OffersModelData>? offerList;
  String? token;
  void getToken({String? tk}){
    token=tk!;
    emit(GetTokenState());
  }
  Future<ResponseModel?> getHome({required HomeParams params}) async {
    emit(HomeLoadingState()) ;
    ResponseModel responseModel = await _homeUseCase.call(params: params);
    if (responseModel.isSuccess) {
       homeModel =responseModel.data;
      emit(HomeSuccessState()) ;
    }else{
      emit(HomeErrorState()) ;
    }
    return responseModel;
  }
  BannersModel? bannersModel;
  Future<dynamic> getBanner() async {
    try {
      emit(GetBannerLoadingState()) ;
      ResponseModel responseModel = await _bannerUseCase.call();
      if (responseModel.isSuccess) {
        bannersModel =responseModel.data;
        emit(GetBannerSuccessState()) ;
      }else{
        emit(GetBannerErrorState()) ;
      }
    }catch(e){
      emit(GetBannerErrorState()) ;
    }
  }
  StoreTypesModel? storeTypesModel;
  int currentCategoryId = 0;
  Future<dynamic> getStoreTypes(LatLng? latLng) async {
    try {
      storeTypesModel=null;
      emit(GetStoreTypesLoadingState()) ;
      ResponseModel responseModel = await _storeTypesUseCase.call();
      if (responseModel.isSuccess) {
        storeTypesModel =responseModel.data;
        currentCategoryId = storeTypesModel?.data?.data?[0].id??0;
        getStores(params: HomeParams(latLng: latLng??LatLng(0, 0),storeId: storeTypesModel?.data?.data?[0].id??0));
        getHome(params: HomeParams(latLng: latLng??LatLng(0, 0),storeId: storeTypesModel?.data?.data?[0].id??0));
        emit(GetStoreTypesSuccessState()) ;
      }else{
        emit(GetStoreTypesErrorState()) ;
      }
    }catch(e){
      emit(GetStoreTypesErrorState()) ;
    }
  }
  StoresModel? storesModel;
  Future<dynamic> getStores({required HomeParams params}) async {
    try{
      storesModel=null;
      currentCategoryId=params.storeId??0;
      emit(GetStoresLoadingState()) ;
      print('sadadasd ${params.storeId}');
      ResponseModel responseModel = await _getStoresUseCase.call(params: params);
      print('asdsadasdad ${responseModel.data} }');
      if (responseModel.isSuccess) {

        storesModel =responseModel.data;
        emit(GetStoresSuccessState()) ;
      }else{
        emit(GetStoresErrorState()) ;
      }
    }catch(e){
      emit(GetStoresErrorState()) ;
    }
  }

  // Future<ResponseModel> getRestaurantNearest(LatLng latLng) async {
  //   // restaurantList=null;
  //   // emit(GetRestaurantLoadingState()) ;
  //   // ResponseModel responseModel = await _restaurantsUseCase.call(latLng);
  //   // if (responseModel.isSuccess) {
  //   //   restaurantsNearestModel =responseModel.data;
  //   //   restaurantList =restaurantsNearestModel!.data!;
  //   //   emit(GetRestaurantSuccessState()) ;
  //   // }else{
  //   //   emit(GetRestaurantErrorState()) ;
  //   // }
  //   // return responseModel;
  // }
  Future<dynamic> getOffers({bool? isDoNull}) async {
  //   isDoNull==true?
  //   offerList=null:null;
  //   emit(OffersLoadingState()) ;
  //   ResponseModel responseModel = await _offersUseCase.call();
  //   if (responseModel.isSuccess) {
  //     offersModel =responseModel.data;
  //     offerList=offersModel!.data!;
  //     emit(OffersSuccessState()) ;
  //   }else{
  //     emit(OffersErrorState()) ;
  //   }
  //   return responseModel;
  }

}
