part of 'address_cubit.dart';

@immutable
abstract class AddressState {}

class AddressInitial extends AddressState {}
class GetAddressSuccessState extends AddressState {}
class GetAddressLoadingState extends AddressState {}
class GetAddressErrorState extends AddressState {}

class GetLastAddressSuccessState extends AddressState {}
class GetLastAddressLoadingState extends AddressState {}
class GetLastAddressErrorState extends AddressState {}


class AddAddressLoadingState extends AddressState {}
class AddAddressErrorState extends AddressState {}
class AddAddressSuccessState extends AddressState {}

class GetAllAddressLoadingState extends AddressState {}
class GetAllAddressSuccessState extends AddressState {}
class GetAllAddressErrorState extends AddressState {}

class DeleteAddressLoadingState extends AddressState {}
class DeleteAddressSuccessState extends AddressState {}
class DeleteAddressErrorState extends AddressState {}

class UpdateAddressLoadingState extends AddressState {}
class UpdateAddressSuccessState extends AddressState {}
class UpdateAddressErrorState extends AddressState {}

class ChangeTypeState extends AddressState {}
class AddressLoadingState extends AddressState {}
class AddressSuccessState extends AddressState {}
class GetPositionState extends AddressState {}