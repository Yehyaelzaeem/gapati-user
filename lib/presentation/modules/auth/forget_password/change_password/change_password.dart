import 'package:delivego/presentation/component/component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../component/custom_elevated_button.dart';
import '../../../../component/custom_text_field.dart';
import '../forget_password_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
    final String phone;
   ChangePasswordScreen({super.key, required this.phone});
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ForgetPasswordCubit cubit =context.read<ForgetPasswordCubit>();
    return Scaffold(
      appBar: CustomAppBar(
        title: '${LocaleKeys.changePassword.tr()}',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        child:
        Form(
          key: formKey,
          child:  Column(
            children: [
              verticalSpace(20),
              CustomTextField(
                // textInputType: TextInputType.number,
                prefixIcon: const Icon(
                  Icons.lock_open,
                  color: AppColors.primaryColor,
                ),
                fillColor: AppColors.backGroundGray,
                borderRadius: 12,
                borderColor: AppColors.whiteColor.withOpacity(0.1),
                hintText: LocaleKeys.password.tr(),
                controller:passwordController,
                textInputAction: TextInputAction.next,
                isPassword: true,
              ),
              verticalSpace(20),
              CustomTextField(
                // textInputType: TextInputType.number,
                prefixIcon: const Icon(
                  Icons.lock_open,
                  color: AppColors.primaryColor,
                ),
                validationFunc: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.this_field_required.tr();
                  }
                  if(passwordController.text!=confirmPasswordController.text){
                    return LocaleKeys.password_not_match.tr();
                  }
                  return null;
                },
                fillColor: AppColors.backGroundGray,
                borderRadius: 12,
                borderColor: AppColors.whiteColor.withOpacity(0.1),
                hintText: LocaleKeys.confirm.tr(),
                controller:confirmPasswordController,
                textInputAction: TextInputAction.next,
                isPassword: true,
              ),
              verticalSpace(20),
           BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {},
              builder: (context, state) {
                return    CustomElevatedButton(
                  isLoading:state is ResetPasswordLoadingState,
                  loadingSize: 30,
                  height: 45.h,
                  width: double.infinity,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      cubit.resetPassword(phone, passwordController.text,context);
                    }
                  },
                  buttonText: LocaleKeys.send.tr(),
                );
              })
            ],
          ),
        )
      ),
    );
  }
}
