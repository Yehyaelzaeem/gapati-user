import 'package:cogina/core/helpers/toast_states/enums.dart';
import 'package:cogina/domain/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/model/base/response_model.dart';
import '../../../../../data/model/response/cart_model.dart';
import '../../../../../data/model/response/main_address_model.dart';
import '../../../../../domain/request_body/add_item_body.dart';
import '../../../../../domain/request_body/address_body.dart';
import '../../../../../domain/usecase/cart/add_item_usecase.dart';
import '../../../../../domain/usecase/cart/add_qt_usecase.dart';
import '../../../../../domain/usecase/cart/cart_usecase.dart';
import '../../../../../domain/usecase/cart/delete_item_usecase.dart';
import '../../../../../domain/usecase/cart/sub_qt_usecase.dart';
import '../../../../../domain/usecase/check_out/add_address_usecase.dart';
import '../../../../../domain/usecase/check_out/main_address_usecase.dart';
part 'cart_state.dart';
class CartCubit extends Cubit<CartState> {
  CartCubit({
    required AddAddressUseCase addAddressUseCase,required MainAddressUseCase mainAddressUseCase,
    required DeleteItemUseCase deleteItemUseCase,required CartUseCase cartUseCase,
    required AddQTUseCase addQTUseCase,required SubQTUseCase subQTUseCase,
    required AddItemUseCase addItemUseCase})
      :_addAddressUseCase=addAddressUseCase,_mainAddressUseCase =mainAddressUseCase,_deleteItemUseCase= deleteItemUseCase,
        _addItemUseCase =addItemUseCase,_subQTUseCase=subQTUseCase,_addQTUseCase=addQTUseCase,
        _cartUseCase= cartUseCase,super(CartInitial());

  final formKey = GlobalKey<FormState>();
  final CartUseCase _cartUseCase;
  final AddQTUseCase _addQTUseCase;
  final SubQTUseCase _subQTUseCase;
  final AddItemUseCase _addItemUseCase;
  final MainAddressUseCase _mainAddressUseCase;
  final AddAddressUseCase _addAddressUseCase;
  final DeleteItemUseCase _deleteItemUseCase;
  static CartCubit get(BuildContext context)=>BlocProvider.of(context);
  TextEditingController addressController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  int typeAddress=0;
  List<Items>? items;
  Store? storeDate;
  CartModel? cartModel;
  MainAddressModel? mainAddressModel;
  Future<ResponseModel> getCart() async {
    emit(CartLoadingState()) ;
    ResponseModel responseModel = await _cartUseCase.call();
    if (responseModel.isSuccess) {
       cartModel =responseModel.data;
       if(cartModel!.data!=null){
         items=cartModel!.data!.items;
         storeDate=cartModel!.data!.store;
       }
      emit(CartSuccessState()) ;
    }else{
      emit(CartErrorState()) ;
    }
    return responseModel;
  }

  Future<ResponseModel> addQtCart({required String itemId,required BuildContext context}) async {
    emit(AddQtLoadingState()) ;
    ResponseModel responseModel = await _addQTUseCase.call(itemId: itemId);
    if (responseModel.isSuccess) {
      getCart();
      emit(AddQtSuccessState()) ;
    }else{
      emit(AddQtErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> subQtCart({required String itemId,required BuildContext context}) async {
    emit(SubQtLoadingState()) ;
    ResponseModel responseModel = await _subQTUseCase.call(itemId: itemId);
    if (responseModel.isSuccess) {
      getCart();
      emit(SubQtSuccessState()) ;
    }else{
      emit(SubQtErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> addItemCart({required AddItemBody addItemBody ,required BuildContext context}) async {
    emit(AddItemLoadingState()) ;
    ResponseModel responseModel = await _addItemUseCase.call(addItemBody: addItemBody);
    if (responseModel.isSuccess) {
      getCart();
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast(text: '${responseModel.message}',
            state: ToastStates.success, context: context);
      });
      emit(AddItemSuccessState()) ;
    }else{
      // Future.delayed(const Duration(microseconds: 0)).then((value) {
      //   showToast(text: '${responseModel.message}',
      //       state: ToastStates.error, context: context);
      // });
      emit(AddItemErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> deleteItemCart({required String itemId ,required BuildContext context}) async {
    emit(AddItemLoadingState()) ;
    ResponseModel responseModel = await _deleteItemUseCase.call(itemId: itemId);
    if (responseModel.isSuccess) {
      getCart();
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast(text: '${responseModel.message}',
            state: ToastStates.success, context: context);
      });
      emit(AddItemSuccessState()) ;
    }else{
      // Future.delayed(const Duration(microseconds: 0)).then((value) {
      //   showToast(text: '${responseModel.message}',
      //       state: ToastStates.error, context: context);
      // });
      emit(AddItemErrorState()) ;
    }
    return responseModel;
  }

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

  void changeTypeOfAddress(int x){
    typeAddress =x;
    log('acccccc', typeAddress.toString());
    emit(ChangeTypeState()) ;
  }
}
