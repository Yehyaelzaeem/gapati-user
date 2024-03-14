
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'provider_layout_state.dart';

class ProviderLayoutCubit extends Cubit<ProviderLayoutState> {
  ProviderLayoutCubit() : super(ProviderLayoutInitial());
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    emit(ProviderLayoutInitial());
  }
  void init(int? currentPage) {
    _currentIndex = currentPage??0;
    emit(ProviderLayoutInitial());

  }
}
