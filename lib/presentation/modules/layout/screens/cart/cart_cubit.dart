import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/model/base/response_model.dart';
import '../../../../../data/model/response/cart_model.dart';
import '../../../../../domain/usecase/cart/cart_usecase.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required CartUseCase cartUseCase}) :_cartUseCase= cartUseCase,super(CartInitial());
  final CartUseCase _cartUseCase;
  static CartCubit get(BuildContext context)=>BlocProvider.of(context);
  List<Items>? items;
  Store? storeDate;
  Future<ResponseModel> getCart() async {
    emit(CartLoadingState()) ;
    ResponseModel responseModel = await _cartUseCase.call();
    if (responseModel.isSuccess) {
      CartModel cartModel =responseModel.data;
      items=cartModel.data!.items;
      storeDate=cartModel.data!.store;
      emit(CartSuccessState()) ;
    }else{
      emit(CartErrorState()) ;
    }
    return responseModel;
  }

}
