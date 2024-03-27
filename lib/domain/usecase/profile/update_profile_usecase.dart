import 'dart:io';

import 'package:cogina/domain/logger.dart';

import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';
import '../../../data/model/response/profile_model.dart';
import '../../repository/profile_repo.dart';
import '../../request_body/profile_body.dart';
import '../base_usecase/base_use_case_call.dart';
import '../base_usecase/base_usecase.dart';


class UpdateProfileUseCase implements BaseUseCase<GetProfileModel>{
  final ProfileRepository repository;
  UpdateProfileUseCase({required this.repository});
  Future<ResponseModel> call({required ProfileBody profileBody }) async {
    return BaseUseCaseCall.onGetData<GetProfileModel>( await repository.updateProfile(profileBody: profileBody), onConvert,tag: 'UpdateProfileUseCase');
  }
  Future<ResponseModel> updateImage({required File image }) async {
    return BaseUseCaseCall.onGetData<GetProfileModel>( await repository.updateImageProfile(image: image), onConvertImage,tag: 'UpdateImageProfileUseCase');
  }

  @override
  ResponseModel<GetProfileModel> onConvert(BaseModel baseModel) {
    try{
      GetProfileModel? profileModel = GetProfileModel.fromJson(baseModel.responseData);
      return ResponseModel(true, baseModel.message,data: profileModel);
    }catch(e){
      return ResponseModel(true, baseModel.message,data: baseModel.responseData);
    }
  }

  ResponseModel<GetProfileModel> onConvertImage(BaseModel baseModel) {
    try{
      return ResponseModel(true, baseModel.message,data: baseModel.responseData);
    }catch(e){
      return ResponseModel(true, baseModel.message,data: baseModel.responseData);
    }
  }
}
