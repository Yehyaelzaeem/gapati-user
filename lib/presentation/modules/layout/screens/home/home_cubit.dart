import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../data/model/base/response_model.dart';
import '../../../../../data/model/response/banner_model.dart';
import '../../../../../data/model/response/best_dish_model.dart';
import '../../../../../data/model/response/categories_model.dart';
import '../../../../../data/model/response/home_model.dart';
import '../../../../../data/model/response/home_params.dart';
import '../../../../../data/model/response/offers_model.dart';
import '../../../../../data/model/response/restaurants_nearst_model.dart';
import '../../../../../data/model/response/stores_model.dart';
import '../../../../../domain/usecase/home/banner_usecase.dart';
import '../../../../../domain/usecase/home/get_stores_usecase.dart';
import '../../../../../domain/usecase/home/home_categories.dart';
import '../../../../../domain/usecase/home/home_usecase.dart';
import '../../../../../domain/usecase/home/offers_usecase.dart';
import '../../../../../domain/usecase/home/resturants_usecase.dart';
import '../../../../../domain/usecase/restaurant/best_dish_usecase.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RestaurantsUseCase _restaurantsUseCase;
  final BestDishUseCase _bestDishUseCase;
  final HomeCategoriesUseCase _categoriesUseCase;
  final HomeUseCase _homeUseCase;
  final GetStoresUseCase _getStoresUseCase;
  final BannerUseCase _bannerUseCase;
  final OffersUseCase _offersUseCase;
  HomeCubit({
    required HomeUseCase homeUseCase,
    required RestaurantsUseCase restaurantsUseCase,
    required BestDishUseCase bestDishUseCase,
    required HomeCategoriesUseCase categoriesUseCase,
    required GetStoresUseCase getStoresUseCase,
    required BannerUseCase bannerUseCase,
    required OffersUseCase offersUseCase
  }) :
        _categoriesUseCase=categoriesUseCase,
        _bestDishUseCase=bestDishUseCase,
        _bannerUseCase=bannerUseCase,
        _offersUseCase=offersUseCase,
        _restaurantsUseCase=restaurantsUseCase,
        _getStoresUseCase=getStoresUseCase,
        _homeUseCase =homeUseCase, super(HomeInitial()){
  }
  static HomeCubit get(BuildContext context)=>BlocProvider.of(context);
  BannersModel? bannersModel;
  ///Banner
  Future<dynamic> getBanner() async {
    try {
      emit(GetBannerLoadingState()) ;
      // bannersModel=  BannersModel(
      //   data: BannersModelData(
      //       data:[
      //         BannersData(id: 1,image: 'https://www.eatingwell.com/thmb/m5xUzIOmhWSoXZnY-oZcO9SdArQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/article_291139_the-top-10-healthiest-foods-for-kids_-02-4b745e57928c4786a61b47d8ba920058.jpg'),
      //         BannersData(id: 2,image: 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg'),
      //         BannersData(id: 3,image: 'https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg'),
      //         BannersData(id: 4,image: 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg'),
      //       ]
      //   ),
      // );
      // print('sdadsadads ${bannersModel}');
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



  CategoriesModel? categoriesModel;
  ///Categories
  Future<dynamic> getCategories() async {
    try {
      categoriesModel=null;
      emit(GetStoreTypesLoadingState()) ;
      ResponseModel responseModel = await _categoriesUseCase.call();
      if (responseModel.isSuccess) {
        categoriesModel =responseModel.data;
        emit(GetStoreTypesSuccessState()) ;
      }else{
        emit(GetStoreTypesErrorState()) ;
      }
    }catch(e){
      emit(GetStoreTypesErrorState()) ;
    }
  }



  ///Meals
  Future<dynamic> getMeals() async {
    try {
      categoriesModel=null;
      emit(GetStoreTypesLoadingState()) ;
      ResponseModel responseModel = await _categoriesUseCase.call();
      if (responseModel.isSuccess) {
        categoriesModel =responseModel.data;
        emit(GetStoreTypesSuccessState()) ;
      }else{
        emit(GetStoreTypesErrorState()) ;
      }
    }catch(e){
      emit(GetStoreTypesErrorState()) ;
    }
  }




///Best Dish
  BestDishModel? bestDishModel;
  Future<dynamic> getBestDishes() async {
    try{
      bestDishModel=null;
      emit(GetBestDishLoadingState()) ;
      ResponseModel responseModel = await _bestDishUseCase.call();
      if (responseModel.isSuccess) {
        bestDishModel=responseModel.data;
        print('dsdd ${bestDishModel?.data?.length??'sss'}');
        emit(GetBestDishSuccessState()) ;
      }else{
        emit(GetBestDishErrorState()) ;
      }
    }catch(e){
      emit(GetBestDishErrorState()) ;
    }
  }

















  ///Token
  String? token;
  void getToken({String? kToken}){
    token=kToken??'';
    emit(GetTokenState());
  }


  // HomeModel? homeModel;
  // RestaurantsNearestModel? restaurantsNearestModel;
  // List<RestaurantsNearestModelData>? restaurantList;


  // Future<ResponseModel?> getHome({required HomeParams params}) async {
  //   emit(HomeLoadingState()) ;
  //   ResponseModel responseModel = await _homeUseCase.call(params: params);
  //   if (responseModel.isSuccess) {
  //      homeModel =responseModel.data;
  //     emit(HomeSuccessState()) ;
  //   }else{
  //     emit(HomeErrorState()) ;
  //   }
  //   return responseModel;
  // }

  int currentCategoryId = 0;

  // StoresModel? storesModel;
  // Future<dynamic> getStores({required HomeParams params}) async {
  //   try{
  //     storesModel=null;
  //     currentCategoryId=params.storeId??0;
  //     emit(GetStoresLoadingState()) ;
  //     print('sadadasd ${params.storeId}');
  //     ResponseModel responseModel = await _getStoresUseCase.call(params: params);
  //     print('asdsadasdad ${responseModel.data} }');
  //     if (responseModel.isSuccess) {
  //
  //       storesModel =responseModel.data;
  //       emit(GetStoresSuccessState()) ;
  //     }else{
  //       emit(GetStoresErrorState()) ;
  //     }
  //   }catch(e){
  //     emit(GetStoresErrorState()) ;
  //   }
  // }

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

  OffersModel? offersModel;
  List<OffersModelData>? offerList;
  /// Offers
  Future<dynamic> getsOffers({bool? isDoNull}) async {
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
