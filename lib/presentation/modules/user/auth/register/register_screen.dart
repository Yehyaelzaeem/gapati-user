import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/presentation/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../component/custom_elevated_button.dart';
import '../../../../component/custom_text_field.dart';
import '../../../../dialog/base/dailog.dart';


class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
   bool isVisible = true;
   bool _isChecked = true;
   bool isVisible2 = true;
   TextEditingController email = TextEditingController();
   TextEditingController fullName = TextEditingController();
   TextEditingController phone = TextEditingController();
   TextEditingController pass = TextEditingController();
   TextEditingController pass2 = TextEditingController();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundGray,
      appBar: const CustomAppBar(
        title: 'Sign up',
        isBackButtonExist: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(20),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(20),
                        const Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.backGroundGray,
                            child: Icon(Icons.camera_alt_rounded,size: 50,color: Colors.grey,),
                          ),
                        ),
                        verticalSpace(30),
                        CustomTextField(
                          contentHorizontalPadding: 20,
                            fillColor: AppColors.backGroundGray,
                            borderRadius: 40,
                            borderColor: AppColors.whiteColor.withOpacity(0.1),
                            hintText: 'Full Name',
                            controller: fullName),
                        verticalSpace(20),
                        CustomTextField(
                            contentHorizontalPadding: 20,
                            fillColor: AppColors.backGroundGray,
                            borderRadius: 40,
                            borderColor: AppColors.whiteColor.withOpacity(0.1),
                            hintText: 'Phone Number',
                            controller: phone),
                        verticalSpace(20),
                        CustomTextField(
                            contentHorizontalPadding: 20,
                            fillColor: AppColors.backGroundGray,
                            borderRadius: 40,
                            borderColor: AppColors.whiteColor.withOpacity(0.1),
                            hintText: 'Email',
                            controller: email),
                        verticalSpace(20),

                        CustomTextField(
                            contentHorizontalPadding: 20,
                            fillColor: AppColors.backGroundGray,
                            isPassword: isVisible,
                            borderRadius: 40,
                            suffixIcon: IconButton(
                              icon: Icon(
                                  color: Colors.grey.shade500,
                                  isVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                            ),
                            borderColor: AppColors.whiteColor.withOpacity(0.1),
                            hintText: 'Password',
                            controller: pass),
                        verticalSpace(20),
                        CustomTextField(
                            contentHorizontalPadding: 20,
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

                            borderColor: AppColors.whiteColor.withOpacity(0.1),
                            hintText: 'Confirm Password',
                            controller: pass2),
                        verticalSpace(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'By creating an account you agree our',
                                  style: TextStyles.font18Black700Weight
                                      .copyWith(fontWeight: FontWeight.w500,fontSize: 14),
                                ),
                                InkWell(
                                  onTap:(){
                                    customShowDialog(
                                        title: 'Terms and Conditions',
                                        body:
                                        '''
As of my last update in January 2022, McDonald's is a globally recognized fast-food restaurant chain known for its hamburgers, cheeseburgers, French fries, and other fast-food items. Here are some general points about McDonald's:

1. **History**: McDonald's was founded in 1940 by Richard and Maurice McDonald in San Bernardino, California, USA. It has since grown into one of the largest and most recognizable fast-food chains in the world.

2. **Menu**: McDonald's menu typically includes a variety of burgers, chicken sandwiches, salads, breakfast items, fries, desserts, and beverages. The exact menu offerings may vary by location and country to cater to local preferences.

3. **Global Presence**: McDonald's operates in over 100 countries and serves millions of customers each day. It has a vast network of franchisees and company-owned restaurants worldwide.

4. **Innovation**: Over the years, McDonald's has been known for its innovative marketing campaigns, menu additions, and restaurant designs. It has also made efforts to adapt to changing consumer preferences by introducing healthier menu options and sustainability initiatives.

5. **Community Engagement**: McDonald's is involved in various community outreach programs and charitable initiatives. It often supports local communities through sponsorships, scholarships, and partnerships with nonprofit organizations.

6. **Employment**: McDonald's is one of the largest employers globally, providing job opportunities to people across different age groups and backgrounds. It offers training programs and career development opportunities for its employees.

                                        ''',
                                        onPressed: () {
                                          context.pop();
                                        },
                                        context: context);
                                  },
                                  child: Text(
                                    'Terms and Privacy Policy',
                                    style: TextStyles.font18Black700Weight
                                        .copyWith(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        verticalSpace(20),
                        CustomElevatedButton(
                          onTap: (){
                            context.pushNamed(RoutesRestaurants.registerSuccessScreen);
                          },
                          buttonText: 'Sign in',
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          fontSize: 17,
                          borderRadius: 40,
                        ),
                        verticalSpace(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyles.font18Black700Weight
                                  .copyWith(fontWeight: FontWeight.w500,fontSize: 15),
                            ),
                            horizontalSpace(10),
                            InkWell(
                              onTap: (){
                                context.pop();
                                // NavigationService.push(RoutesRestaurants.loginScreen);
                              },
                              child: Text(
                                'Sign in!',
                                style: TextStyles.font18Black700Weight
                                    .copyWith(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.redColor.withOpacity(0.5)),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
