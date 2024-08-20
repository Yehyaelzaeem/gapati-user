import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../data/model/base/response_model.dart';
import '../../../../../../data/model/response/profile_model.dart';
import '../../../../../../domain/request_body/profile_body.dart';
import '../../../../../../domain/usecase/local/get_user_token_usecase.dart';
import '../../../../../../domain/usecase/profile/get_profile_usecase.dart';
import '../../../../../../domain/usecase/profile/update_profile_usecase.dart';
import '../../../../chats/cubit/chat_cubit.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required GetProfileUseCase profileUseCase, required UpdateProfileUseCase updateProfileUseCase})
      :_profileUseCase= profileUseCase,_updateProfileUseCase=updateProfileUseCase,super(ProfileInitial());
  final GetProfileUseCase _profileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  static ProfileCubit get(BuildContext context)=>BlocProvider.of(context);
  ProfileModel? profileModel;
  TextEditingController emailController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<ResponseModel> getProfile({bool? updateFirebase}) async {
    profileModel=null;
    emit(GetProfileLoadingState()) ;
    ResponseModel responseModel = await _profileUseCase.call();
    if (responseModel.isSuccess) {
      GetProfileModel model =responseModel.data;
      profileModel=model.data;
      if(updateFirebase==true){
        ChatCubit.get().updateUserProfile(
            name: '${profileModel?.firstName??''} ${profileModel?.lastName??''}',
            phone:  profileModel?.mobileNumber??'',
            image: profileModel?.image??''
        );
      }
      emit(GetProfileSuccessState()) ;
    }else{
      emit(GetProfileErrorState()) ;
    }
    return responseModel;
  }

  ///variables
  final ProfileBody _body = ProfileBody(mobile: '', email: '');

  ///getters
  ProfileBody get body => _body;

  Future<ResponseModel> updateProfile() async {
    emit(UpdateProfileLoadingState()) ;
    _assignProfileBody(phone: phoneController.text, email: emailController.text);
    ResponseModel responseModel = await _updateProfileUseCase.call(profileBody: body);
    if (responseModel.isSuccess) {
      getProfile(updateFirebase: true);
      Navigator.of(NavigationService.navigationKey.currentContext!).pop();
      emit(UpdateProfileSuccessState()) ;
    }else{
      emit(UpdateProfileErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> updateImageProfile() async {
    emit(UpdateProfileLoadingState()) ;
    ResponseModel responseModel = await _updateProfileUseCase.updateImage(image: imageFile!);
    if (responseModel.isSuccess) {
      imageFile=null;
      emit(UpdateProfileSuccessState()) ;
    }else{
      emit(UpdateProfileErrorState()) ;
    }
    return responseModel;
  }

  File? imageFile;
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile =File(image.path);
    }
    emit(PickImageState());
  }
  void _assignProfileBody({required String phone,required String email}) {
    body.setData(phone: phone, email: email);
  }
  void pushProfileData(){
    emailController.text=profileModel!.email.toString();
    phoneController.text=profileModel!.mobileNumber.toString();
    emit(PushProfileDataState());
  }

}
