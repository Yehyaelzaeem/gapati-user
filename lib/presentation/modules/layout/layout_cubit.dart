import 'package:cogina/presentation/modules/layout/screens/favorite/favorite_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/home/home_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/more/profile/profile_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/routing/navigation_services.dart';
import '../../../domain/usecase/local/get_user_token_usecase.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit({required GetUserTokenUseCase getUserTokenUseCase}) : _getUserTokenUseCase=getUserTokenUseCase, super(LayoutInitial()){
  }
  static LayoutCubit get(BuildContext context)=>BlocProvider.of(context);
  final GetUserTokenUseCase _getUserTokenUseCase;


  void initLayOut(){
    _getUserTokenUseCase.call().then((value){
      var context =NavigationService.navigationKey.currentContext!;
     if(HomeCubit.get(context).token!=null&&HomeCubit.get(context).token!.isNotEmpty){
       ProfileCubit.get(context).getProfile();
       FavoriteCubit.get(context).getFavorite(context);
       FavoriteCubit.get(context).getFavoriteRestaurant(context);
       HomeCubit.get(context).getOffers(isDoNull: true);
       emit(LayoutInitial());
     }
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
