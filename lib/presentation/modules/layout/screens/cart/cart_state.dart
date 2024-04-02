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

