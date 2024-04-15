import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/model/base/response_model.dart';
import '../../../../../data/model/response/more_contact_us_model.dart';
import '../../../../../domain/usecase/more/about_us_usecase.dart';
import '../../../../../domain/usecase/more/privacy_usecase.dart';
import '../../../../../domain/usecase/more/terms_usecase.dart';
part 'more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  final AboutUsUseCase _aboutUsUseCase;
  final PrivacyUseCase _privacyUseCase;
  final TermsUseCase _termsUseCase;
  MoreCubit({required AboutUsUseCase aboutUsUseCase,required PrivacyUseCase privacyUseCase,required TermsUseCase termsUseCase}) :
        _aboutUsUseCase =aboutUsUseCase,_privacyUseCase=privacyUseCase,_termsUseCase=termsUseCase,
        super(MoreInitial());

  static  MoreCubit get(BuildContext context)=>BlocProvider.of(context);
  MoreContactUsModel? aboutUsData;
  MoreContactUsModel? privacyData;
  MoreContactUsModel? termsData;
  Future<ResponseModel> getAboutUs() async {
    aboutUsData=null;
    emit(GetDataLoadingState()) ;
    ResponseModel responseModel = await _aboutUsUseCase.call();
    if (responseModel.isSuccess) {
      MoreContactUsModel moreContactUsModel=responseModel.data;
      emit(GetDataSuccessState(data: moreContactUsModel.data.toString())) ;
    }else{
      emit(GetDataErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> getPrivacy() async {
    privacyData=null;
    emit(GetDataLoadingState()) ;
    ResponseModel responseModel = await _privacyUseCase.call();
    if (responseModel.isSuccess) {
      MoreContactUsModel moreContactUsModel=responseModel.data;
      emit(GetDataSuccessState(data: moreContactUsModel.data!.toString())) ;
    }else{
      emit(GetDataErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> getTerms() async {
    termsData=null;
    emit(GetDataLoadingState()) ;
    ResponseModel responseModel = await _termsUseCase.call();
    if (responseModel.isSuccess) {
      MoreContactUsModel moreContactUsModel=responseModel.data;
      emit(GetDataSuccessState(data:  moreContactUsModel.data!.toString())) ;
    }else{
      emit(GetDataErrorState()) ;
    }
    return responseModel;
  }
}
