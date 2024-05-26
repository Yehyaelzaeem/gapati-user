import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/function/function.dart';
import '../../../../../../core/helpers/toast_states/enums.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../data/model/base/response_model.dart';
import '../../../../../../domain/request_body/check_out_body.dart';
import '../../../../../../domain/usecase/check_out/check_out_usecase.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../more/address/address_cubit.dart';
import '../cart_cubit.dart';
part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {

  final CheckOutUseCase _checkOutUseCase;
  CheckOutCubit({required CheckOutUseCase checkOutUseCase }) :_checkOutUseCase=checkOutUseCase,super(CheckOutInitial());
  static CheckOutCubit get (BuildContext context)=>BlocProvider.of(context);


  int currentStep = 0;

  void sendCheckOutData(BuildContext context){
    logInFirst(function: (){
      CartCubit cartCubit =CartCubit.get(context);
      AddressCubit addressCubit= AddressCubit.get(context);
      if(cartCubit.products.isNotEmpty){
        if(addressCubit.orderAddress==null){
          CheckOutCubit.get(context).changeSteps(0);
          showToast(text: LocaleKeys.mesAddress.tr(), state: ToastStates.error, context: context);
        }
        else{
          CheckOutModel checkOutBody=CheckOutModel(
              name: cartCubit.storeName!,
              addressId:addressCubit.orderAddress!.id!.toString(),
              paymentMethod: 'cash',
              note: 'note',
              storeId: cartCubit.products[0].storeId!.toString(),
              branchId: '0', items: cartCubit.products.map((e) => ItemModel(
            itemId: e.id.toString(),
            qty: e.count!.toString(),
            note: 'note',
            extras: e.itemExtraModelDataSelected?.map((e) => ExtraModel(extraId: e.id!.toString())).toList() ?? [],
          )).toList());
          checkOut(checkOutBody: checkOutBody, context: context);
        }
      }
      else{
        showToast(text: LocaleKeys.cartEmpty.tr(), state: ToastStates.error, context: context);
      }
    }, context: context, screenName: 'checkOut');
  }

  ///Check Out
  Future<ResponseModel> checkOut({required CheckOutModel checkOutBody,required BuildContext context}) async {
    emit(CheckOutLoadingState()) ;
    ResponseModel responseModel = await _checkOutUseCase.call(checkOutBody: checkOutBody);
    if (responseModel.isSuccess) {
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        AddressCubit cubit=  AddressCubit.get(context);
        CartCubit.get(context).removeAll();
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
