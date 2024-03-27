part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class GetProfileLoadingState extends ProfileState {}
class GetProfileSuccessState extends ProfileState {}
class GetProfileErrorState extends ProfileState {}
class UpdateProfileLoadingState extends ProfileState {}
class UpdateProfileSuccessState extends ProfileState {}
class UpdateProfileErrorState extends ProfileState {}
class PickImageState extends ProfileState {}
class PushProfileDataState extends ProfileState {}
