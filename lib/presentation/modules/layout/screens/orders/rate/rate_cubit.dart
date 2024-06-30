import 'package:bloc/bloc.dart';
import 'package:cogina/main.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../data/model/base/response_model.dart';
import '../../../../../../domain/request_body/rate_body.dart';
import '../../../../../../domain/usecase/orders/rate_usecase.dart';

part 'rate_state.dart';

class RateCubit extends Cubit<RateState> {
  final RateUseCase _rateUseCase;
  RateCubit({required RateUseCase rateUseCase}) : _rateUseCase=rateUseCase, super(RateInitial());
  TextEditingController textEditingController =TextEditingController();
  double? rate;
  Future<ResponseModel> rateOrder(int id) async {

    emit(RateStatesLoading()) ;
    RateBody rateBody =RateBody(
      orderId: id.toString(),
      note: textEditingController.text,
      rate: rate.toString() ??'0.0'
    );
    ResponseModel responseModel = await _rateUseCase.call(rateBody: rateBody);
    if (responseModel.isSuccess) {
      emit(RateStatesSuccess()) ;
      Navigator.of(appContext).pop();
    }else{
      emit(RateStatesError()) ;
    }
    return responseModel;
  }

}
