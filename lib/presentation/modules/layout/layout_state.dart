part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}
class GetTokenLoadingState extends LayoutState {}
class GetTokenSuccessState extends LayoutState {}
class GetTokenErrorState extends LayoutState {}
class LayOutState extends LayoutState {}

