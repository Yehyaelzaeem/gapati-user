import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/translations/locale_keys.dart';
import 'package:cogina/presentation/component/component.dart';
import 'package:cogina/presentation/modules/auth/register/register_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../component/custom_elevated_button.dart';
import '../../../component/custom_text_field.dart';
import '../../../dialog/base/dailog.dart';


class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
   bool _isChecked = true;
   @override
  Widget build(BuildContext context) {
     RegisterCubit cubit =RegisterCubit.get(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundGray,
      appBar:  CustomAppBar(
        title: LocaleKeys.signUp.tr(),
        isBackButtonExist: false,
      ),
      body: Form(
        key: cubit.formKey,
        child: Padding(
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
                          // verticalSpace(20),
                          // const Center(
                          //   child: CircleAvatar(
                          //     radius: 50,
                          //     backgroundColor: AppColors.backGroundGray,
                          //     child: Icon(Icons.camera_alt_rounded,size: 50,color: Colors.grey,),
                          //   ),
                          // ),
                          verticalSpace(30),
                          CustomTextField(
                            contentHorizontalPadding: 20,
                              fillColor: AppColors.backGroundGray,
                              borderRadius: 40,
                              validationFunc: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys.firstNameEmpty.tr();
                                }
                                return null;
                              },
                              borderColor: AppColors.whiteColor.withOpacity(0.1),
                              hintText: LocaleKeys.firstName.tr(),
                              controller: cubit.firstNameController),
                          verticalSpace(20),
                          CustomTextField(
                              contentHorizontalPadding: 20,
                              fillColor: AppColors.backGroundGray,
                              borderRadius: 40,
                              validationFunc: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys.lastNameEmpty.tr();
                                }
                                return null;
                              },
                              borderColor: AppColors.whiteColor.withOpacity(0.1),
                              hintText: LocaleKeys.lastName.tr(),
                              controller: cubit.lastNameController),
                          verticalSpace(20),
                          CustomTextField(
                              validationFunc: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys.mobilePhoneEmpty.tr();
                                }
                                return null;
                              },
                              contentHorizontalPadding: 20,
                              textInputType: TextInputType.number,
                              fillColor: AppColors.backGroundGray,
                              borderRadius: 40,
                              borderColor: AppColors.whiteColor.withOpacity(0.1),
                              hintText: LocaleKeys.mobilePhone.tr(),

                              controller: cubit.phoneController),
                          verticalSpace(20),
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
                                    LocaleKeys.creatingAccountAgree.tr(),
                                    style: TextStyles.font18Black700Weight
                                        .copyWith(fontWeight: FontWeight.w500,fontSize: 14),
                                  ),
                                  InkWell(
                                    onTap:(){
                                      customShowDialog(
                                          title: LocaleKeys.termsAndConditions.tr(),
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
                                      LocaleKeys.termsAndConditions.tr(),
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
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.register(context);
                              }
                            },
                            buttonText: LocaleKeys.signUp.tr(),
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
                                LocaleKeys.alreadyHaveAccount.tr(),
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
                                  '${LocaleKeys.signIn.tr()}!',
                                  style: TextStyles.font18Black700Weight
                                      .copyWith(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.secondPrimaryColor),
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
      ),
    );
  }
}
