import 'package:cogina/core/helpers/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helpers/toast_states/enums.dart';
import '../../../../../../data/model/base/response_model.dart';
import '../../../../../../data/model/response/address_model.dart';
import '../../../../../../data/model/response/main_address_model.dart';
import '../../../../../../domain/request_body/address_body.dart';
import '../../../../../../domain/usecase/address/add_address_usecase.dart';
import '../../../../../../domain/usecase/address/address_usecase.dart';
import '../../../../../../domain/usecase/address/main_address_usecase.dart';
part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressUseCase _addressUseCase;
  final MainAddressUseCase _mainAddressUseCase;
  final AddAddressUseCase _addAddressUseCase;
  AddressCubit({required AddAddressUseCase addAddressUseCase,required MainAddressUseCase mainAddressUseCase,required AddressUseCase addressUseCase}):
        _addAddressUseCase=addAddressUseCase,_mainAddressUseCase =mainAddressUseCase,_addressUseCase =addressUseCase, super(AddressInitial());
  MainAddressModel? mainAddressModel;
  AddressModel? addressModel;
  int typeAddress=0;
  TextEditingController addressController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  static AddressCubit get(BuildContext context) => BlocProvider.of(context);

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
  Future<ResponseModel> getAllAddress() async {
    addressModel=null;
    emit(GetAllAddressLoadingState()) ;
    ResponseModel responseModel = await _addressUseCase.call();
    if (responseModel.isSuccess) {
      addressModel =responseModel.data;
      emit(GetAllAddressSuccessState()) ;
    }else{
      emit(GetAllAddressErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> addMainAddress({required AddressBody addressBody,required BuildContext context,bool? pop}) async {
    emit(AddAddressLoadingState()) ;
    ResponseModel responseModel = await _addAddressUseCase.call(addressBody: addressBody);
    if (responseModel.isSuccess) {
      getMainAddress();
      getAllAddress();
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast(text: responseModel.message.toString(), state: ToastStates.success, context: context);
        pop==true?
            context.pop():null;
      });
      phoneController.text='';
      addressController.text='';
      emit(AddAddressSuccessState()) ;
    }else{
      emit(AddAddressErrorState()) ;
    }
    return responseModel;
  }

  void changeTypeOfAddress(int x){
    typeAddress =x;
    emit(ChangeTypeState()) ;
  }
}