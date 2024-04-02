import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/cart_model.dart';
import '../../repository/cart_repo.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class CartUseCase implements BaseUseCase<CartModel>{
  final CartRepository repository;
  CartUseCase({required this.repository});
  Future<ResponseModel> call() async {
    return BaseUseCaseCall.onGetData<CartModel>( await repository.getCart(), onConvert,tag: 'CartUseCase');
  }

  @override
  ResponseModel<CartModel> onConvert(BaseModel baseModel) {
    try{
      CartModel? cartModel = CartModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??true, baseModel.message,data: cartModel);
    }catch(e){
      CartModel? cartModel = CartModel.fromJson(baseModel.responseData);
      return ResponseModel(baseModel.status??false, baseModel.message,data: cartModel);
    }
  }
}
