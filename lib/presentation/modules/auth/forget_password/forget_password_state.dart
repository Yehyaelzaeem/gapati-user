part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
final class ForgetPasswordLoadingState extends ForgetPasswordState {}
final class ForgetPasswordSuccessState extends ForgetPasswordState {}
final class ForgetPasswordErrorState extends ForgetPasswordState {}
final class CheckOtpLoadingState extends ForgetPasswordState {}
final class CheckOtpSuccessState extends ForgetPasswordState {}
final class CheckOtpErrorState extends ForgetPasswordState {}
final class ResetPasswordLoadingState extends ForgetPasswordState {}
final class ResetPasswordSuccessState extends ForgetPasswordState {}
final class ResetPasswordErrorState extends ForgetPasswordState {}