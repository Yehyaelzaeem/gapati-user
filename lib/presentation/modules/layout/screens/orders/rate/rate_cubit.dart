import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'rate_state.dart';

class RateCubit extends Cubit<RateState> {
  RateCubit() : super(RateInitial());
  TextEditingController textEditingController =TextEditingController();

}
