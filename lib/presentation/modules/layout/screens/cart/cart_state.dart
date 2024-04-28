part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class CartLoadingState extends CartState {}
class CartSuccessState extends CartState {}
class CartErrorState extends CartState {}
class AddQtLoadingState extends CartState {}
class SubQtLoadingState extends CartState {}
class AddQtSuccessState extends CartState {}
class SubQtSuccessState extends CartState {}
class AddQtErrorState extends CartState {}
class SubQtErrorState extends CartState {}
class AddItemErrorState extends CartState {}
class AddItemLoadingState extends CartState {}
class AddItemSuccessState extends CartState {}
class UpdateItemLoadingState extends CartState {}
class UpdateItemSuccessState extends CartState {}
class UpdateItemErrorState extends CartState {}
class AddStoreNameState extends CartState {}


class GetCartDataState extends CartState {}
class SetItemsCartDataState extends CartState {}
class GetItemsCartDataState extends CartState {}
class AddCounterCartDataState extends CartState {}
class RemoveCounterCartDataState extends CartState {}
class AddQuantityState extends CartState {}
class DeleteQuantityState extends CartState {}
class RemoveItemsState extends CartState {}
class AddTotalPriceState extends CartState {}
class RemoveTotalPriceState extends CartState {}
class SendOrderState extends CartState {}
class ChangeStepState extends CartState {}
class ChangeLoadingState extends CartState {}
