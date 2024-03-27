import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/routing/routes.dart';
import 'package:cogina/presentation/component/component.dart';
import 'package:cogina/presentation/component/custom_elevated_button.dart';
import 'package:cogina/presentation/modules/auth/login/login_cubit.dart';
import 'package:cogina/presentation/modules/auth/login/widget/login_widget.dart';
import 'package:cogina/presentation/modules/auth/login/widget/otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/routing/navigation_services.dart';

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
        title: 'Sign in',
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
                          ' Welcome Back!',
                          style: TextStyles.font20Black700Weight.copyWith(color: AppColors.primaryColor),
                        ),
                        Text(
                          ' Sign in to continue',
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
                              'Already have not an account?',
                              style: TextStyles.font18Black700Weight
                                  .copyWith(fontWeight: FontWeight.w500,fontSize: 15),
                            ),
                            horizontalSpace(10),
                            InkWell(
                              onTap: (){
                                NavigationService.push(RoutesRestaurants.registerScreen);
                              },
                              child: Text(
                                'Sign up!',
                                style: TextStyles.font18Black700Weight
                                    .copyWith(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.redColor.withOpacity(0.5)),
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