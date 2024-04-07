part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class RestaurantsOrdersLoadingState extends OrdersState {}
class RestaurantsOrdersSuccessState extends OrdersState {}
class RestaurantsOrdersErrorState extends OrdersState {}

class OrdersLoadingState extends OrdersState {}
class OrdersSuccessState extends OrdersState {}
class OrdersErrorState extends OrdersState {}
