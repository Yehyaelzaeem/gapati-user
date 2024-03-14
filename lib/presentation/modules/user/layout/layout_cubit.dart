import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());


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
