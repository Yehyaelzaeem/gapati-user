import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'prescription_state.dart';

class PrescriptionCubit extends Cubit<PrescriptionState> {
  PrescriptionCubit() : super(PrescriptionInitial());
}
