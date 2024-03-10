part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeViewModelLoading extends HomeState {}
class HomeViewModelError extends HomeState {
//  final ErrorModel _error ;
//
//  ErrorModel get error => _error;
//
//    HomeViewModelError({
//     required ErrorModel error,
//   }) : _error = error;
// }
// class HomeViewModelData extends HomeState {
//   final ResponseModel<List<OfferEntity>> _responseModel;
//
//   ResponseModel<List<OfferEntity>> get responseModel => _responseModel;
//
//   HomeViewModelData({
//     required ResponseModel<List<OfferEntity>> responseModel,
//   }) : _responseModel = responseModel;
}
