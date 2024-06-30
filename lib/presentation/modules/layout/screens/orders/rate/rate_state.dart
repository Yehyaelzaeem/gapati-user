part of 'rate_cubit.dart';

@immutable
sealed class RateState {}

final class RateInitial extends RateState {}
final class RateStatesLoading extends RateState {}
final class RateStatesSuccess extends RateState {}
final class RateStatesError extends RateState {}
