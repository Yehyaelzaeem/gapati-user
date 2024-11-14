import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/toast_states/enums.dart';
import '../../../../../core/routing/navigation_services.dart';
import '../../../../../data/model/response/cart_model.dart';
import '../../../../../data/model/response/category_item_model.dart';
import '../../../../../data/model/response/item_extra_model.dart';
import '../../../../../domain/usecase/cart/add_item_usecase.dart';
import '../../../../../domain/usecase/cart/add_qt_usecase.dart';
import '../../../../../domain/usecase/cart/cart_usecase.dart';
import '../../../../../domain/usecase/cart/delete_item_usecase.dart';
import '../../../../../domain/usecase/cart/sub_qt_usecase.dart';
import '../../../../../domain/usecase/cart/update_item_usecase.dart';
import '../../../../../generated/locale_keys.g.dart';
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
  Future<bool> addProduct({required CategoryItemsData product ,required String storeName}) async {
    print('SADSDADSADSAD ${product.toJson()} ${storeName}');
    if(products.isEmpty){
      // if (products.where((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected).toList().length == 0){
      //   products.add(product);
      //   addStoreName(storeName);
      // };
      products.add(product);
      addStoreName(storeName);
      // products.where((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected).first.count = 1;
      emit(GetCartDataState());
      return true;
    }
    if(products[0].storeId == product.storeId ){
      // if (products.where((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected).toList().length == 0){
      //   products.add(product);
      //   addStoreName(storeName);
      // };
      products.add(product);
      addStoreName(storeName);
      // products.where((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected).first.count = 1;
      emit(GetCartDataState());
      showToast(text: LocaleKeys.additionDone.tr(), state: ToastStates.success, context: NavigationService.navigationKey.currentContext!);
      return true;
    }
    else{
      showToast(text: LocaleKeys.anotherCart.tr(), state: ToastStates.error, context: NavigationService.navigationKey.currentContext!);
    return false;
    }

  }
  Future<dynamic> addQty(CategoryItemsData product,String? storeName) async {
    if (products.where((CategoryItemsData element) => element.id == product.id).toList().length == 0){
      addProduct(product: product, storeName: storeName!);
      emit(GetCartDataState());
    }else{
      product.count = product.count! + 1;
      products[products.indexOf(product)].count=product.count;
      // products.where((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected).first.count = product.count;
      emit(GetCartDataState());

    }
    emit(GetCartDataState());
  }
  Future<dynamic> updateExtra(CategoryItemsData product,List<ItemExtraModelData> itemExtraModelData) async {
    product.itemExtraModelDataSelected=itemExtraModelData;
    products.firstWhere((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected).itemExtraModelDataSelected = itemExtraModelData;
  }
  Future<dynamic> updateProductSize(CategoryItemsData product,ProductSizeData productSizeData) async {

    int index =products.indexOf(product);
    print('product.toJson() ${productSizeData.name}');
    product.productSizeSelected=ProductSize(data:[productSizeData]);
    products[index] = product;
     print('object ### ${products[index].productSizeSelected!.data![0].name.toString()}');
    emit(GetCartDataState());

    // products.firstWhere((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected).itemExtraModelDataSelected = itemExtraModelData;
  }
  Future<dynamic> removeQty(CategoryItemsData product,int index) async {
    product.count = product.count! - 1;
    if (product.count == 0)
        products.removeAt(index);
      // products.removeWhere((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected);
    else
      products[index].count = product.count;
      // products.where((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected).first.count = product.count;
    emit(GetCartDataState()); 
  }

  Future<dynamic>  removeProduct(CategoryItemsData product) async {
    products.remove(product);
    // products.removeWhere((CategoryItemsData element) => element.id == product.id && element.itemExtraModelDataSelected==product.itemExtraModelDataSelected);
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
    double totalItem=0.0;
    if(product.productSizeSelected?.data!=null&&product.productSizeSelected?.data!.isNotEmpty==true && product.productSizeSelected?.data![0].id!=0){
      totalItem = double.parse(product.productSizeSelected?.data?[0].priceAfterDiscount?.toString()??'0.0');
    }
    else{
      if(product.productSize?.data?.isNotEmpty??false){
        totalItem = double.parse(product.productSize?.data?[0].priceAfterDiscount?.toString()??'0.0');
      }
      else{
        totalItem = double.parse(product.priceAfterDiscount?.toString()?? (product.price?.toString()??'0.0'));

      }
    }
    if(product.itemExtraModelDataSelected!=null&&product.itemExtraModelDataSelected!.length!=0){
      product.itemExtraModelDataSelected!.forEach((element) {
        totalItem += double.parse(element.price!) ;
      });
    }

    return totalItem * product.count!;
  }
  void removeAll() {
    products.clear();
    emit(GetCartDataState());
  }
void updateData(){
  emit(UpdateExtraCartDataState());
}







}
