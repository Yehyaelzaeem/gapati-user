import 'package:cogina/domain/logger.dart';
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
  Future<ResponseModel> getRestaurantOrders() async {
    emit(RestaurantsOrdersLoadingState()) ;
    ResponseModel responseModel = await _ordersUseCase.getRestaurantsOrder();
    if (responseModel.isSuccess) {
      orderModel=responseModel.data;
      log('restaurantsOrderData', orderModel!.toJson().toString());

      emit(RestaurantsOrdersSuccessState()) ;
    }else{
      emit(RestaurantsOrdersErrorState()) ;
    }
    return responseModel;
  }

  Future<ResponseModel> getOrders({required int orderId}) async {
    emit(OrdersLoadingState()) ;
    ResponseModel responseModel = await _ordersUseCase.getOrders(orderId: orderId);
    if (responseModel.isSuccess) {
      orderDetailsModel=responseModel.data;
      log('getOrders', orderDetailsModel!.toJson().toString());
      emit(OrdersSuccessState()) ;
    }else{
      emit(OrdersErrorState()) ;
    }
    return responseModel;
  }

}
