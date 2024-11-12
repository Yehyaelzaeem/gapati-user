import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../core/helpers/toast_states/enums.dart';
import '../../../data/model/response/accept_prescriptoin_params.dart';
import '../../../data/model/response/prescription_params.dart';
import '../../../data/model/response/prescriptions_model.dart';
import '../../../domain/usecase/home/accept_prescription_usecase.dart';
import '../../../domain/usecase/home/get_prescriptions_usecase.dart';
import '../../../domain/usecase/home/prescription_usecase.dart';

part 'prescription_state.dart';

class PrescriptionCubit extends Cubit<PrescriptionState> {
  final PrescriptionUseCase _prescriptionUseCase;
  final AcceptPrescriptionUseCase _acceptPrescriptionUseCase;
  final GetPrescriptionsUseCase _getPrescriptionsUseCase;

  PrescriptionCubit({
    required PrescriptionUseCase prescriptionUseCase,
    required AcceptPrescriptionUseCase acceptPrescriptionUseCase,
    required GetPrescriptionsUseCase getPrescriptionsUseCase,
  })  :
        _acceptPrescriptionUseCase = acceptPrescriptionUseCase,
        _getPrescriptionsUseCase = getPrescriptionsUseCase,
        _prescriptionUseCase = prescriptionUseCase,
        super(PrescriptionInitial());

 Future<void> sendPrescription({required PrescriptionParams params,required BuildContext context}) async{
  try{
    emit(PrescriptionLoading());
    final response = await _prescriptionUseCase.call(params: params);
    if(response.isSuccess){
      showToast(text: response.message!, state: ToastStates.success, context: context);
      Navigator.pop(context);
      emit(PrescriptionSuccess());
    }else{
      emit(PrescriptionError());
    }
  }catch(e){
    emit(PrescriptionError());
  }
 }
  Future<void> acceptPrescription({required AcceptPrescriptionParams params,required BuildContext context}) async{
    try{
      emit(AcceptPrescriptionLoading());
      final response = await _acceptPrescriptionUseCase.call(params: params);
      if(response.isSuccess){
        showToast(text: response.message??'', state: ToastStates.success, context: context);
        getPrescriptions();
        // Navigator.pop(context);
        emit(AcceptPrescriptionSuccess());
      }else{
        emit(AcceptPrescriptionError());
      }
    }catch(e){
      emit(AcceptPrescriptionError());
    }
  }

  PrescriptionsModel? prescriptionsModel;
 Future<void> getPrescriptions() async{
  try{
    emit(PrescriptionLoading());
    final response = await _getPrescriptionsUseCase.call();
    if(response.isSuccess){
       prescriptionsModel = response.data!;
      emit(PrescriptionSuccess());
    }else{
      emit(PrescriptionError());
    }
  }catch(e){
    emit(PrescriptionError());
  }
 }
}
