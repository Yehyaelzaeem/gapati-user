import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helpers/toast_states/enums.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../data/model/base/response_model.dart';
import '../../../../../../domain/request_body/check_out_body.dart';
import '../../../../../../domain/usecase/check_out/check_out_usecase.dart';
part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {

  final CheckOutUseCase _checkOutUseCase;
  CheckOutCubit({required CheckOutUseCase checkOutUseCase }) :_checkOutUseCase=checkOutUseCase,super(CheckOutInitial());
  static CheckOutCubit get (BuildContext context)=>BlocProvider.of(context);


  int currentStep = 0;

  ///Check Out
  Future<ResponseModel> checkOut({required CheckOutBody checkOutBody,required BuildContext context}) async {
    emit(CheckOutLoadingState()) ;
    ResponseModel responseModel = await _checkOutUseCase.call(checkOutBody: checkOutBody);
    if (responseModel.isSuccess) {
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        // CartCubit.get(context).getCart(context);
        showToast(text: responseModel.message.toString(), state: ToastStates.success, context: context);
        NavigationService.push(RoutesRestaurants.successOrderScreen);
      });
      emit(CheckOutSuccessState()) ;
    } else{
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast(text: responseModel.message.toString(), state: ToastStates.error, context: context);
      });
      emit(CheckOutErrorState()) ;
    }
    return responseModel;
  }

  /// Change State

  void changeSteps(int x){
    currentStep =x;
    emit(ChangeTypeState()) ;
  }
}
