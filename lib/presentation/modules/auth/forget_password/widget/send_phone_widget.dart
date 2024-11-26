import 'package:delivego/core/helpers/spacing.dart';
import 'package:delivego/presentation/component/component.dart';
import 'package:delivego/presentation/component/custom_elevated_button.dart';
import 'package:delivego/presentation/component/texts/black_texts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/global/styles/colors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../component/custom_text_field.dart';
import '../forget_password_cubit.dart';

class SendPhoneWidget extends StatelessWidget {
   SendPhoneWidget({Key? key}) : super(key: key);
   final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ForgetPasswordCubit cubit =context.read<ForgetPasswordCubit>();
    return Container(
      child:Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlackBoldText(label: '${LocaleKeys.enterPhone.tr()}',
              fontSize: 16,
            ),
            verticalSpace(20),
            CustomTextField(
              textInputType: TextInputType.number,
              prefixIcon: const Icon(
                Icons.phone,
                color: AppColors.primaryColor,
              ),
              fillColor: AppColors.backGroundGray,
              borderRadius: 12,
              borderColor: AppColors.whiteColor.withOpacity(0.1),
              hintText: LocaleKeys.phone.tr(),
              controller:cubit.phoneController,
              textInputAction: TextInputAction.next,
              // onFieldSubmitted: (vsl){
              //   cubit.otpCode(cubit.phoneController.text,context);
              // },
            ),
            verticalSpace(30),
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {},
              builder: (context, state) {
                return CustomElevatedButton(
                    isLoading:state is ForgetPasswordLoadingState,
                    height: 45.h,
                    loadingSize: 30,
                    width: MediaQuery.sizeOf(context).width,
                    onTap: (){
                      if(formKey.currentState!.validate()){
                        cubit.forgetPassword(cubit.phoneController.text);
                      }
                    },
                    buttonText: '${LocaleKeys.send.tr()}');
              },
            )
          ],
        ),
      )
    );
  }
}
