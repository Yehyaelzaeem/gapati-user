import 'package:cogina/domain/logger.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helpers/toast_states/enums.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../data/model/base/response_model.dart';
import '../../../../../../data/model/response/main_address_model.dart';
import '../../../../../../domain/request_body/address_body.dart';
import '../../../../../../domain/request_body/check_out_body.dart';
import '../../../../../../domain/usecase/check_out/add_address_usecase.dart';
import '../../../../../../domain/usecase/check_out/check_out_usecase.dart';
import '../../../../../../domain/usecase/check_out/main_address_usecase.dart';
part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  final MainAddressUseCase _mainAddressUseCase;
  final AddAddressUseCase _addAddressUseCase;
  final CheckOutUseCase _checkOutUseCase;
  CheckOutCubit({required AddAddressUseCase addAddressUseCase,required MainAddressUseCase mainAddressUseCase,required CheckOutUseCase checkOutUseCase }) :_checkOutUseCase=checkOutUseCase,_addAddressUseCase=addAddressUseCase,_mainAddressUseCase =mainAddressUseCase, super(CheckOutInitial());
  static CheckOutCubit get (BuildContext context)=>BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  MainAddressModel? mainAddressModel;
  TextEditingController addressController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  int typeAddress=0;
  int currentStep = 0;

  /// Address
  Future<ResponseModel> getMainAddress() async {
    emit(GetAddressLoadingState()) ;
    ResponseModel responseModel = await _mainAddressUseCase.call();
    if (responseModel.isSuccess) {
      mainAddressModel =responseModel.data;
      emit(GetAddressSuccessState()) ;
    }else{
      emit(GetAddressErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> addMainAddress({required AddressBody addressBody,required BuildContext context}) async {
    emit(AddAddressLoadingState()) ;
    ResponseModel responseModel = await _addAddressUseCase.call(addressBody: addressBody);
    if (responseModel.isSuccess) {
      getMainAddress();
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast(text: responseModel.message.toString(), state: ToastStates.success, context: context);
      });
      emit(AddAddressSuccessState()) ;
    }else{
      emit(AddAddressErrorState()) ;
    }
    return responseModel;
  }

  ///Check Out
  Future<ResponseModel> checkOut({required CheckOutBody checkOutBody,required BuildContext context}) async {
    emit(CheckOutLoadingState()) ;
    ResponseModel responseModel = await _checkOutUseCase.call(checkOutBody: checkOutBody);
    if (responseModel.isSuccess) {
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        CartCubit.get(context).getCart();
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
  void changeTypeOfAddress(int x){
    typeAddress =x;
    emit(ChangeTypeState()) ;
  }
  void changeSteps(int x){
    currentStep =x;
    emit(ChangeTypeState()) ;
  }
}
