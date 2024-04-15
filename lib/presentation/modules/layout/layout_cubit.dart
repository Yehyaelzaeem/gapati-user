import 'package:bloc/bloc.dart';
import 'package:cogina/domain/logger.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/cart_screen.dart';
import 'package:cogina/presentation/modules/layout/screens/favorite/favorite_screen.dart';
import 'package:cogina/presentation/modules/layout/screens/home/home_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/home/home_screen.dart';
import 'package:cogina/presentation/modules/layout/screens/more/more_screen.dart';
import 'package:cogina/presentation/modules/layout/screens/more/profile/profile_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/orders/orders_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/routing/navigation_services.dart';
import '../../../core/tabs/tab.dart';
import '../../../core/translations/locale_keys.dart';
import '../../../data/model/base/response_model.dart';
import '../../../domain/usecase/local/get_user_token_usecase.dart';
import '../../../generated/assets.dart';
import 'navigation_tabs.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit({required GetUserTokenUseCase getUserTokenUseCase}) : _getUserTokenUseCase=getUserTokenUseCase, super(LayoutInitial()){
  }
  static LayoutCubit get(BuildContext context)=>BlocProvider.of(context);
  final GetUserTokenUseCase _getUserTokenUseCase;


  void initLayOut(){
    _getUserTokenUseCase.call().then((value){
      ProfileCubit.get(NavigationService.navigationKey.currentContext!).getProfile();
      HomeCubit.get(NavigationService.navigationKey.currentContext!).getOffers();
      emit(LayoutInitial());
    });
  }
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    emit(LayoutInitial());
  }
  void init(int? currentPage) {
    _currentIndex = currentPage??0;
    emit(LayoutInitial());
  }


}
