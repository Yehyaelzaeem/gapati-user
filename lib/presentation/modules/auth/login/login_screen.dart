import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/routing/routes.dart';
import 'package:cogina/presentation/component/component.dart';
import 'package:cogina/presentation/component/custom_elevated_button.dart';
import 'package:cogina/presentation/component/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/navigation_services.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  bool isVisible2 = true;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundGray,
      appBar: const CustomAppBar(
        title: 'Sign in',
        isBackButtonExist: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(150),
              Text(
                ' Welcome Back!',
                style: TextStyles.font20Black700Weight
                    .copyWith(color: AppColors.primaryColor),
              ),
              Text(
                ' Sign in to continue',
                style: TextStyles.font18Black700Weight
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              verticalSpace(30),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.whiteColor,
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 25.h),
                  child: StatefulBuilder(builder: (context, setState) {
                    return Column(
                      children: [
                        CustomTextField(
                            prefixIcon: const Icon(
                              Icons.email,
                              color: AppColors.primaryColor,
                            ),
                            fillColor: AppColors.backGroundGray,
                            borderRadius: 40,
                            borderColor: AppColors.whiteColor.withOpacity(0.1),
                            hintText: 'Email',
                            controller: email),
                        verticalSpace(20),
                        CustomTextField(
                            fillColor: AppColors.backGroundGray,
                            isPassword: isVisible2,
                            borderRadius: 40,
                            suffixIcon: IconButton(
                              icon: Icon(
                                  color: Colors.grey.shade500,
                                  isVisible2
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  isVisible2 = !isVisible2;
                                });
                              },
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: AppColors.primaryColor,
                            ),
                            borderColor: AppColors.whiteColor.withOpacity(0.1),
                            hintText: 'Password',
                            controller: pass),
                        verticalSpace(20),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: AppColors.primaryColor,
                              value: _isChecked,
                              onChanged: (newValue) {
                                setState(() {
                                  _isChecked = newValue!;
                                });
                              },
                            ),
                            Text(
                              'Remember me',
                              style: TextStyles.font18Black700Weight
                                  .copyWith(fontWeight: FontWeight.w500,fontSize: 15),
                            ),
                            const Spacer(),
                            Text(
                              'Forget Password?',
                              style: TextStyles.font18Black700Weight
                                  .copyWith(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.redColor.withOpacity(0.5)),
                            ),
                          ],
                        ),
                        CustomElevatedButton(
                            onTap: (){
                              context.pushNamed(RoutesRestaurants.layout,arguments: {'currentPage':0});
                            },
                            buttonText: 'Sign in',
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            fontSize: 17,
                            borderRadius: 40,
                        )
                      ],
                    );
                  }),
                ),
              ),
              verticalSpace(100),
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
          ),
        ),
      ),
    );
  }
}
