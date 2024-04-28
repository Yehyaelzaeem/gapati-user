import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/routing/routes.dart';
import 'package:cogina/core/services/error/error_handler.dart';
import 'package:cogina/core/translations/locale_keys.dart';
import 'package:cogina/presentation/component/component.dart';
import 'package:cogina/presentation/modules/auth/login/login_cubit.dart';
import 'package:cogina/presentation/modules/auth/login/widget/login_widget.dart';
import 'package:cogina/presentation/modules/auth/login/widget/otp_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/routing/navigation_services.dart';
import '../register/register_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit =LoginCubit.get(context);
    cubit.type=='auth';
    return Scaffold(
      resizeToAvoidBottomInset: true, // Set to true to allow the Scaffold to resize when the keyboard is displayed
      backgroundColor: AppColors.backGroundGray,
      appBar:  CustomAppBar(
        title:LocaleKeys.signIn.tr(),
        onBackPress: (){
          if(cubit.type=='otp'){
            cubit.changeType('auth');
          }else{
            context.pop();
          }
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(150),
                        Text(
                          LocaleKeys.welcomeBack.tr(),
                          style: TextStyles.font20Black700Weight.copyWith(color: AppColors.primaryColor),
                        ),
                        Text(
                          LocaleKeys.signContinue.tr(),
                          style: TextStyles.font18Black700Weight.copyWith(fontWeight: FontWeight.w500),
                        ),
                        verticalSpace(cubit.type=='auth'||cubit.type=='otp'?30:20),
                        cubit.type=='auth'? LoginWidget():
                        const OtpWidget(),
                        verticalSpace(100),
                        //SignInUseCase
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.haveAccount.tr(),
                              style: TextStyles.font18Black700Weight
                                  .copyWith(fontWeight: FontWeight.w500,fontSize: 15),
                            ),
                            horizontalSpace(10),
                            InkWell(
                              onTap: (){
                                 RegisterCubit.get(context).changeType('register');
                                NavigationService.push(RoutesRestaurants.registerScreen);
                              },
                              child: Text(
                                '${LocaleKeys.signUp.tr()}!',
                                style: TextStyles.font18Black700Weight
                                    .copyWith(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.secondPrimaryColor),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}