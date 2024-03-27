part of 'restaurant_cubit.dart';

@immutable
abstract class RestaurantState {}

class RestaurantInitial extends RestaurantState {}
class GetCategoriesLoadingState extends RestaurantState {}
class GetCategoriesSuccessState extends RestaurantState {}
class GetCategoriesErrorState extends RestaurantState {}
