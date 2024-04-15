import 'package:cogina/core/routing/routes.dart';
import 'package:cogina/presentation/component/component.dart';
import 'package:cogina/presentation/component/custom_elevated_button.dart';
import 'package:cogina/presentation/component/custom_text_field.dart';
import 'package:cogina/presentation/component/images/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cogina/core/global/styles/colors.dart';
import '../../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../../core/routing/navigation_services.dart';
import '../profile_cubit.dart';


class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit =ProfileCubit.get(context);
    cubit.pushProfileData();
    return Scaffold(
      backgroundColor: AppColors.backGroundGray,
      appBar: const CustomAppBar(
        title: 'Edit Profile',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Form(
                  key: cubit.formKey,
                  child: Column(
                          children: [
                            verticalSpace(20),
                            Stack(
                              children: [
                                Container(
                                  height: 115.h,
                                  width: 115.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      boxShadow: const [BoxShadow(color: Colors.black26,blurRadius: 3,
                                          offset: Offset(2,4)
                                      )]
                                  ),
                                  child:  cubit.imageFile!=null?
                                 ClipRRect(
                                   borderRadius: BorderRadius.circular(60),
                                   child: Image.file(cubit.imageFile!,
                                   fit: BoxFit.cover,
                                   ),
                                 )
                                      :
                                  CustomImage(image: cubit.profileModel!.image!,radius: 60,)
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child:
                                  CircleAvatar(
                                    radius: 18,
                                    child: Center(
                                      child: IconButton(
                                          onPressed: (){
                                            cubit.pickImage();
                                          },
                                          icon: const Icon(Icons.camera_alt_outlined,size: 20,color: AppColors.whiteColor,)),
                                    ),
                                  ),)
                              ],
                            ),
                            verticalSpace(50),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 7,
                                      // offset: Offset(2,4)
                                  )]
                              ),
                              child: CustomTextField(
                                  // validationFunc: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'The email is empty';
                                  //   }
                                  //   return null;
                                  // },
                                  borderRadius: 30,
                                  prefixIcon: const Icon(Icons.email),
                                  borderColor: AppColors.whiteColor.withOpacity(0.1),
                                  hintText: 'email', controller: cubit.emailController),
                            ),
                            verticalSpace(30),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 7,
                                      // offset: Offset(2,4)
                                  )]
                              ),
                              child: CustomTextField(
                                  validationFunc: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'The mobile phone is empty';
                                    }
                                    return null;
                                  },
                                  borderRadius: 30,
                                  prefixIcon: const Icon(Icons.phone),
                                  borderColor: AppColors.whiteColor.withOpacity(0.1),
                                  hintText: 'phone', controller: cubit.phoneController),
                            ),
                            verticalSpace(50),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 1,
                                      offset: Offset(2,4)
                                  )]
                              ),
                              child: CustomElevatedButton(
                                  height: 45.h,
                                  borderRadius: 30,
                                  width: double.infinity,
                                  onTap: (){
                                    if (cubit.formKey.currentState!.validate()) {
                                      cubit.updateProfile();
                                    }
                                    if(cubit.imageFile!=null){
                                      cubit.updateImageProfile();
                                    }
                                  },
                                  isLoading: state is UpdateProfileLoadingState,
                                  buttonText: 'Save'),
                            ),
                            verticalSpace(20),
                            // Container(
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(30),
                            //       boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 1,
                            //           offset: Offset(2,4)
                            //       )]
                            //   ),
                            //   child: CustomElevatedButton(
                            //       borderRadius: 30,
                            //       height: 45.h,
                            //       width: double.infinity,
                            //       onTap: (){
                            //         NavigationService.push(RoutesRestaurants.changePasswordScreen);
                            //       }, buttonText: 'Change Password'),
                            // )


                          ],
                        ),
                );
              },
            ),
        ),
      ),
    );
  }
}
