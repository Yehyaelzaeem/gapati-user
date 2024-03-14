import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  // final GetOffersUseCase _getOffersUseCase;
  //
  //  HomeCubit({
  //   required GetOffersUseCase getOffersUseCase,
  // }) : _getOffersUseCase = getOffersUseCase,super(HomeInitial());


  ///colling api functions

  //get Offer list
  getOffers() async {
    emit(HomeViewModelLoading());
    // ResponseModel<List<OfferEntity>> responseModel = await _getOffersUseCase.callTest();
    // emit(HomeViewModelData(responseModel: responseModel));
  }
  HomeCubit() : super(HomeInitial());
}
