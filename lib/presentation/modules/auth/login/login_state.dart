part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class ChangeTypeState extends LoginState {}
class LoginErrorState extends LoginState {
 final ErrorModel? error;
 LoginErrorState(this.error);
}
class LoginSuccessState extends LoginState {}
class LoginLoadingState extends LoginState {}
class OtpLoadingState extends LoginState {}
class OtpSuccessState extends LoginState {}
class OtpErrorState extends LoginState {}
class VisitorState extends LoginState {}
