part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}
class GetFavoriteLoadingState extends FavoriteState {}
class GetFavoriteSuccessState extends FavoriteState {}
class GetFavoriteErrorState extends FavoriteState {}
