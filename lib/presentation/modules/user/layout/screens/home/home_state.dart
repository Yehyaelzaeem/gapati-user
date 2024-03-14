part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeViewModelLoading extends HomeState {}
class HomeViewModelError extends HomeState {

}
