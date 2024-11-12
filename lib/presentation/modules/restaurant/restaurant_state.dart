part of 'restaurant_cubit.dart';

@immutable
abstract class RestaurantState {}

class RestaurantInitial extends RestaurantState {}
class GetCategoriesLoadingState extends RestaurantState {}
class GetCategoriesSuccessState extends RestaurantState {}
class GetCategoriesErrorState extends RestaurantState {}
class ChangeLoadingState extends RestaurantState {}
class SearchLoadingState extends RestaurantState {}
class SearchSuccessState extends RestaurantState {}
class SearchErrorState extends RestaurantState {}
class GetBestDishLoadingState extends RestaurantState {}
class GetBestDishSuccessState extends RestaurantState {}
class GetBestDishErrorState extends RestaurantState {}
