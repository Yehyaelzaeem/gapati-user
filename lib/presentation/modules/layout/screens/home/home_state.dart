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

