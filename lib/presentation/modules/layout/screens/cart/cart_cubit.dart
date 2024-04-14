import 'package:cogina/core/helpers/toast_states/enums.dart';
import 'package:cogina/domain/logger.dart';
import 'package:cogina/presentation/modules/layout/screens/home/home_cubit.dart';
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
part 'cart_state.dart';
class CartCubit extends Cubit<CartState> {

  final CartUseCase _cartUseCase;
  final AddQTUseCase _addQTUseCase;
  final SubQTUseCase _subQTUseCase;
  final AddItemUseCase _addItemUseCase;
  final DeleteItemUseCase _deleteItemUseCase;
  CartCubit({
    required DeleteItemUseCase deleteItemUseCase,required CartUseCase cartUseCase,
    required AddQTUseCase addQTUseCase,required SubQTUseCase subQTUseCase,
    required AddItemUseCase addItemUseCase})
      :_deleteItemUseCase= deleteItemUseCase,
        _addItemUseCase =addItemUseCase,_subQTUseCase=subQTUseCase,_addQTUseCase=addQTUseCase,
        _cartUseCase= cartUseCase,super(CartInitial());


  static CartCubit get(BuildContext context)=>BlocProvider.of(context);

  List<Items>? items;
  Store? storeDate;
  CartModel? cartModel;

  Future<ResponseModel?> getCart(context) async {
    if(HomeCubit.get(context).token!=null&&HomeCubit.get(context).token!.isNotEmpty){
      emit(CartLoadingState()) ;
      ResponseModel responseModel = await _cartUseCase.call();
      if (responseModel.isSuccess) {
        cartModel =responseModel.data;
        if(cartModel!.data!=null){
          items=cartModel!.data!.items;
          storeDate=cartModel!.data!.store;
        }else{
          items=null;
          storeDate=null;
        }
        emit(CartSuccessState()) ;
      }else{
        emit(CartErrorState()) ;
      }
      return responseModel;
    }else{
      items=null;
      storeDate=null;
      emit(CartLoadingState()) ;
    }
    return null;
  }

  Future<ResponseModel> addQtCart({required String itemId,required BuildContext context}) async {
    emit(AddQtLoadingState()) ;
    ResponseModel responseModel = await _addQTUseCase.call(itemId: itemId);
    if (responseModel.isSuccess) {
      getCart(context);
      emit(AddQtSuccessState()) ;
    }else{
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast(text: responseModel.message!, state: ToastStates.error, context: context);
      });
      emit(AddQtErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> subQtCart({required String itemId,required BuildContext context}) async {
    emit(SubQtLoadingState()) ;
    ResponseModel responseModel = await _subQTUseCase.call(itemId: itemId);
    if (responseModel.isSuccess) {
      getCart(context);
      emit(SubQtSuccessState()) ;
    }else{
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast(text: responseModel.message!, state: ToastStates.error, context: context);
      });
      emit(SubQtErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> addItemCart({required AddItemBody addItemBody ,required BuildContext context}) async {
    emit(AddItemLoadingState()) ;
    ResponseModel responseModel = await _addItemUseCase.call(addItemBody: addItemBody);
    if (responseModel.isSuccess) {
      getCart(context);
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast(text: '${responseModel.message}',
            state: ToastStates.success, context: context);
      });
      emit(AddItemSuccessState()) ;
    }else{
      // Future.delayed(const Duration(microseconds: 0)).then((value) {
      //   showToast(text: responseModel.message!, state: ToastStates.error, context: context);
      // });
      emit(AddItemErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> deleteItemCart({required String itemId ,required BuildContext context}) async {
    emit(AddItemLoadingState()) ;
    ResponseModel responseModel = await _deleteItemUseCase.call(itemId: itemId);
    if (responseModel.isSuccess) {
      getCart(context);
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast(text: '${responseModel.message}',
            state: ToastStates.success, context: context);
      });
      emit(AddItemSuccessState()) ;
    }else{
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast(text: responseModel.message!, state: ToastStates.error, context: context);
      });

      emit(AddItemErrorState()) ;
    }
    return responseModel;
  }


}
