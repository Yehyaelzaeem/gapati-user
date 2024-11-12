part of 'prescription_cubit.dart';

@immutable
sealed class PrescriptionState {}

final class PrescriptionInitial extends PrescriptionState {}
final class PrescriptionLoading extends PrescriptionState {}
final class PrescriptionError extends PrescriptionState {}
final class PrescriptionSuccess extends PrescriptionState {}
final class AcceptPrescriptionLoading extends PrescriptionState {}
final class AcceptPrescriptionError extends PrescriptionState {}
final class AcceptPrescriptionSuccess extends PrescriptionState {}
