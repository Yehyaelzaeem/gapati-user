import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/model/base/response_model.dart';
import '../../../../../data/model/response/home_model.dart';
import '../../../../../data/model/response/offers_model.dart';
import '../../../../../domain/usecase/home/home_usecase.dart';
import '../../../../../domain/usecase/home/offers_usecase.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required HomeUseCase homeUseCase,required OffersUseCase offersUseCase}) :_offersUseCase=offersUseCase,_homeUseCase =homeUseCase, super(HomeInitial()){
    getHome();
  }
  final HomeUseCase _homeUseCase;
  final OffersUseCase _offersUseCase;
  static HomeCubit get(BuildContext context)=>BlocProvider.of(context);

  HomeModel? homeModel;
  List<DataHome>? listData;
  OffersModel? offersModel;
  List<OffersModelData>? offerList;
  String? token;
  void getToken({String? tk}){
    token=tk!;
    emit(GetTokenState());
  }
  Future<ResponseModel> getHome() async {
    listData=null;
    emit(HomeLoadingState()) ;
    ResponseModel responseModel = await _homeUseCase.call();
    if (responseModel.isSuccess) {
       homeModel =responseModel.data;
       listData=homeModel!.data!.data!;
      emit(HomeSuccessState()) ;
    }else{
      emit(HomeErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> getOffers() async {
    offerList=null;
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
