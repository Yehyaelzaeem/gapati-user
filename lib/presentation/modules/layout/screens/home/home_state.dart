part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoadingState extends HomeState {}
class HomeSuccessState extends HomeState {}
class HomeErrorState extends HomeState {}
class OffersLoadingState extends HomeState {}
class OffersSuccessState extends HomeState {}
class OffersErrorState extends HomeState {}
class GetTokenState extends HomeState {}
class GetRestaurantLoadingState extends HomeState {}
class GetRestaurantSuccessState extends HomeState {}
class GetRestaurantErrorState extends HomeState {}
class GetBannerLoadingState extends HomeState {}
class GetBannerSuccessState extends HomeState {}
class GetBannerErrorState extends HomeState {}
class GetStoreTypesLoadingState extends HomeState {}
class GetStoreTypesSuccessState extends HomeState {}
class GetStoreTypesErrorState extends HomeState {}
class GetStoresLoadingState extends HomeState {}
class GetStoresSuccessState extends HomeState {}
class GetStoresErrorState extends HomeState {}
class GetBestDishLoadingState extends HomeState {}
class GetBestDishSuccessState extends HomeState {}
class GetBestDishErrorState extends HomeState {}

