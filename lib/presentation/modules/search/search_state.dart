part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class ChangeLoadingState extends SearchState {}
final class GetSearchLoadingState extends SearchState {}
final class GetSearchSuccessState extends SearchState {}
final class GetSearchErrorState extends SearchState {}
