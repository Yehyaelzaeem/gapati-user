import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/model/base/response_model.dart';
import '../../../../../data/model/response/order_details_model.dart';
import '../../../../../data/model/response/order_model.dart';
import '../../../../../domain/usecase/orders/orders_usecase.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersUseCase _ordersUseCase;
  OrdersCubit({required OrdersUseCase ordersUseCase}) :_ordersUseCase=ordersUseCase, super(OrdersInitial());
  static OrdersCubit get(BuildContext context)=>BlocProvider.of(context);

  OrderModel? orderModel;
  OrderDetailsModel? orderDetailsModel;
  Future<ResponseModel> getOrders() async {
    emit(RestaurantsOrdersLoadingState()) ;
    ResponseModel responseModel = await _ordersUseCase.getRestaurantsOrder();
    if (responseModel.isSuccess) {
      orderModel=responseModel.data;

      emit(RestaurantsOrdersSuccessState()) ;
    }else{
      emit(RestaurantsOrdersErrorState()) ;
    }
    return responseModel;
  }

  Future<ResponseModel> getOrdersDetails({required int orderId}) async {
    orderDetailsModel=null;
    emit(OrdersLoadingState()) ;
    ResponseModel responseModel = await _ordersUseCase.getOrders(orderId: orderId);
    if (responseModel.isSuccess) {
      orderDetailsModel=responseModel.data;
      emit(OrdersSuccessState()) ;
    }else{
      emit(OrdersErrorState()) ;
    }
    return responseModel;
  }

}
