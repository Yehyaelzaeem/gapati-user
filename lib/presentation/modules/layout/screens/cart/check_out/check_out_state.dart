part of 'check_out_cubit.dart';

@immutable
abstract class CheckOutState {}

class CheckOutInitial extends CheckOutState {}

class GetAddressSuccessState extends CheckOutState {}
class GetAddressLoadingState extends CheckOutState {}
class GetAddressErrorState extends CheckOutState {}

class AddAddressLoadingState extends CheckOutState {}
class AddAddressErrorState extends CheckOutState {}
class AddAddressSuccessState extends CheckOutState {}
class ChangeTypeState extends CheckOutState {}

class CheckOutLoadingState extends CheckOutState {}
class CheckOutSuccessState extends CheckOutState {}
class CheckOutErrorState extends CheckOutState {}