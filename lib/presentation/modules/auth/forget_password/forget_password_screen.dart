import 'package:delivego/core/helpers/spacing.dart';
import 'package:delivego/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../component/custom_app_bar.dart';
import 'forget_password_cubit.dart';
import 'widget/otp_widget.dart';
import 'widget/send_phone_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordCubit cubit =context.read<ForgetPasswordCubit>();
    cubit.otpCode=null;
    return Scaffold(
      appBar: CustomAppBar(
        title: '${LocaleKeys.forgetPassword.tr()}',
      ),
      body:
      BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            child: Column(
              children: [
                verticalSpace(30),
                if(cubit.otpCode!=null)
                  OtpWidget()
                else
                SendPhoneWidget(),

              ],
            ),
          );
        },
    ));
  }
}
