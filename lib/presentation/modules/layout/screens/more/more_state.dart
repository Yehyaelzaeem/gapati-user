part of 'more_cubit.dart';

@immutable
abstract class MoreState {}

class MoreInitial extends MoreState {}

class GetDataSuccessState extends MoreState {
  final String data;
  GetDataSuccessState({required this.data});
}
class GetDataErrorState extends MoreState {}
class GetDataLoadingState extends MoreState {}
