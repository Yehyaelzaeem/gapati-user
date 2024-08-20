import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/model/response/cart_model.dart';
import '../../../../../data/model/response/category_item_model.dart';
import '../../../../../data/model/response/item_extra_model.dart';
import '../../../../../domain/usecase/cart/add_item_usecase.dart';
import '../../../../../domain/usecase/cart/add_qt_usecase.dart';
import '../../../../../domain/usecase/cart/cart_usecase.dart';
import '../../../../../domain/usecase/cart/delete_item_usecase.dart';
import '../../../../../domain/usecase/cart/sub_qt_usecase.dart';
import '../../../../../domain/usecase/cart/update_item_usecase.dart';
part 'cart_state.dart';
class CartCubit extends Cubit<CartState> {

  final CartUseCase _cartUseCase;
  final AddQTUseCase _addQTUseCase;
  final SubQTUseCase _subQTUseCase;
  final AddItemUseCase _addItemUseCase;
  final DeleteItemUseCase _deleteItemUseCase;
  final UpdateItemUseCase _updateItemUseCase;
  CartCubit({
    required DeleteItemUseCase deleteItemUseCase,required CartUseCase cartUseCase,
    required AddQTUseCase addQTUseCase,required SubQTUseCase subQTUseCase,
    required AddItemUseCase addItemUseCase,required UpdateItemUseCase updateItemUseCase})
      :_deleteItemUseCase= deleteItemUseCase,_updateItemUseCase=updateItemUseCase,
        _addItemUseCase =addItemUseCase,_subQTUseCase=subQTUseCase,_addQTUseCase=addQTUseCase,
        _cartUseCase= cartUseCase,super(CartInitial());


  static CartCubit get(BuildContext context)=>BlocProvider.of(context);

  String? storeName;
  void addStoreName(String x){
    storeName=x;
  }
  List<CategoryItemsData> products = <CategoryItemsData>[];

  Future<dynamic> addProduct({required CategoryItemsData product ,required String storeName}) async {
    if (products.where((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected).toList().length == 0){
      products.add(product);
      addStoreName(storeName);
    };
    products.where((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected).first.count = 1;
    emit(GetCartDataState());
  }
  Future<dynamic> addQty(CategoryItemsData product,String? storeName) async {
    if (products.where((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected).toList().length == 0){
      addProduct(product: product, storeName: storeName!);
      emit(GetCartDataState());
    }else{
      product.count = product.count! + 1;
      products.where((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected).first.count = product.count;
      emit(GetCartDataState());

    }
      emit(GetCartDataState());
  }
  Future<dynamic> updateExtra(CategoryItemsData product,List<ItemExtraModelData> itemExtraModelData) async {
    product.itemExtraModelDataSelected=itemExtraModelData;
    products.firstWhere((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected).itemExtraModelDataSelected = itemExtraModelData;
  }
  Future<dynamic> removeQty(CategoryItemsData product) async {
    product.count = product.count! - 1;
    if (product.count == 0)
      products.removeWhere((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected);
    else
      products.where((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected).first.count = product.count;
    emit(GetCartDataState());  }

  Future<dynamic>  removeProduct(CategoryItemsData product) async {
    products.removeWhere((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected);
    emit(GetCartDataState());
  }

  double totalPrice() {
    double total = 0;
    products.forEach((CategoryItemsData element) {
      total += getItemPrice(element);
      // total=0.0;
    });
    return total;
  }
  double getItemPrice(CategoryItemsData product) {
    double totalItem = double.parse(product.priceAfterDiscount!.toString());
    if(product.itemExtraModelDataSelected!=null&&product.itemExtraModelDataSelected!.length!=0){
      product.itemExtraModelDataSelected!.forEach((element) {
        totalItem += double.parse(element.price!) ;
      });
    }

    return totalItem * product.count!;
  }
  void removeAll() {
    products.clear();
  }
void updateData(){
  emit(UpdateExtraCartDataState());
}









 // List<ItemExtraModelData> itemExtraModelDataList=[];
 // List<String> extraIdList=[];
//   List<Items>? items;
//   Store? storeDate;
//   CartModel? cartModel;
  //
  // Future<ResponseModel?> getCart(context) async {
  //   if(HomeCubit.get(context).token!=null&&HomeCubit.get(context).token!.isNotEmpty){
  //     emit(CartLoadingState()) ;
  //     ResponseModel responseModel = await _cartUseCase.call();
  //     if (responseModel.isSuccess) {
  //       cartModel =responseModel.data;
  //       if(cartModel!.data!=null){
  //         items=cartModel!.data!.items;
  //         storeDate=cartModel!.data!.store;
  //       }else{
  //         items=null;
  //         storeDate=null;
  //       }
  //       emit(CartSuccessState()) ;
  //     }else{
  //       emit(CartErrorState()) ;
  //     }
  //     return responseModel;
  //   }else{
  //     items=null;
  //     storeDate=null;
  //     emit(CartLoadingState()) ;
  //   }
  //   return null;
  // }
  //
  // Future<ResponseModel> addQtCart({required String itemId,required BuildContext context}) async {
  //   emit(AddQtLoadingState()) ;
  //   ResponseModel responseModel = await _addQTUseCase.call(itemId: itemId);
  //   if (responseModel.isSuccess) {
  //     getCart(context);
  //     emit(AddQtSuccessState()) ;
  //   }else{
  //     Future.delayed(const Duration(microseconds: 0)).then((value) {
  //       showToast(text: responseModel.message!, state: ToastStates.error, context: context);
  //     });
  //     emit(AddQtErrorState()) ;
  //   }
  //   return responseModel;
  // }
  // Future<ResponseModel> subQtCart({required String itemId,required BuildContext context}) async {
  //   emit(SubQtLoadingState()) ;
  //   ResponseModel responseModel = await _subQTUseCase.call(itemId: itemId);
  //   if (responseModel.isSuccess) {
  //     getCart(context);
  //     emit(SubQtSuccessState()) ;
  //   }else{
  //     Future.delayed(const Duration(microseconds: 0)).then((value) {
  //       showToast(text: responseModel.message!, state: ToastStates.error, context: context);
  //     });
  //     emit(SubQtErrorState()) ;
  //   }
  //   return responseModel;
  // }
  // Future<bool> addItemCart({required AddItemBody addItemBody ,required BuildContext context}) async {
  //   emit(AddItemLoadingState()) ;
  //   try{
  //     ResponseModel responseModel = await _addItemUseCase.call(addItemBody: addItemBody);
  //     if (responseModel.isSuccess) {
  //       getCart(context);
  //       Future.delayed(const Duration(microseconds: 0)).then((value) {
  //         showToast(text: '${responseModel.message}',
  //             state: ToastStates.success, context: context);
  //       });
  //       emit(AddItemSuccessState()) ;
  //       return true;
  //     }else{
  //       // Future.delayed(const Duration(microseconds: 0)).then((value) {
  //       //   showToast(text: responseModel.message!, state: ToastStates.error, context: context);
  //       // });
  //       emit(AddItemErrorState()) ;
  //       return false;
  //     }
  //   }catch(e){
  //     return false;
  //   }
  //
  // }
  // Future<ResponseModel> deleteItemCart({required String itemId ,required BuildContext context}) async {
  //   emit(AddItemLoadingState()) ;
  //   ResponseModel responseModel = await _deleteItemUseCase.call(itemId: itemId);
  //   if (responseModel.isSuccess) {
  //     getCart(context);
  //     Future.delayed(const Duration(microseconds: 0)).then((value) {
  //       showToast(text: '${responseModel.message}',
  //           state: ToastStates.success, context: context);
  //     });
  //     emit(AddItemSuccessState()) ;
  //   }else{
  //     Future.delayed(const Duration(microseconds: 0)).then((value) {
  //       showToast(text: responseModel.message!, state: ToastStates.error, context: context);
  //     });
  //
  //     emit(AddItemErrorState()) ;
  //   }
  //   return responseModel;
  // }
  //
  // Future<bool> updateItemCart({required UpdateItemBody updateItemBody ,required BuildContext context}) async {
  //   emit(UpdateItemLoadingState()) ;
  //   try{
  //     ResponseModel responseModel = await _updateItemUseCase.call(updateItemBody: updateItemBody);
  //     if (responseModel.isSuccess) {
  //       getCart(context);
  //       Future.delayed(const Duration(microseconds: 0)).then((value) {
  //         showToast(text: '${responseModel.message}',
  //             state: ToastStates.success, context: context);
  //       });
  //       emit(UpdateItemSuccessState()) ;
  //       return true;
  //     }else{
  //       // Future.delayed(const Duration(microseconds: 0)).then((value) {
  //       //   showToast(text: responseModel.message!, state: ToastStates.error, context: context);
  //       // });
  //       emit(UpdateItemErrorState()) ;
  //       return false;
  //     }
  //   }catch(e){
  //     return false;
  //   }
  //
  // }




}
