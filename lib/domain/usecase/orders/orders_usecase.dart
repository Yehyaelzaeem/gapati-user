import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/order_details_model.dart';
import '../../../data/model/response/order_model.dart';
import '../../repository/orders_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class OrdersUseCase implements BaseUseCase<OrderModel>{
  final OrdersRepository repository;
  OrdersUseCase({required this.repository});
  Future<ResponseModel> getRestaurantsOrder() async {
    return BaseUseCaseCall.onGetData<OrderModel>( await repository.getRestaurantOrders(), onConvert,tag: 'OrderUseCase');
  }
  Future<ResponseModel> getOrders({required int orderId}) async {
    return BaseUseCaseCall.onGetData<OrderDetailsModel>( await repository.getOrderDetails(orderId: orderId), onConvertOrders,tag: 'OrdersUseCase');
  }

  @override
  ResponseModel<OrderModel> onConvert(BaseModel baseModel) {
    try{
      OrderModel? restaurantsOrderModel = OrderModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true, baseModel.message,data: restaurantsOrderModel);
    }catch(e){
      OrderModel? restaurantsOrderModel = OrderModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??false, baseModel.message,data: restaurantsOrderModel);
    }
  }
  ResponseModel<OrderDetailsModel> onConvertOrders(BaseModel baseModel) {
    try{
      OrderDetailsModel? ordersModel = OrderDetailsModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true, baseModel.message,data: ordersModel);
    }catch(e){
      OrderDetailsModel? ordersModel = OrderDetailsModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??false, baseModel.message,data: ordersModel);
    }
  }
}
