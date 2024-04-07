import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/routing/routes.dart';
import 'package:cogina/presentation/component/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/assets_constant/images.dart';
import '../../../../core/global/styles/styles.dart';

class LogAsScreen extends StatelessWidget {
  const LogAsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(50),
          Image.asset(RestaurantImages.logo),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Bobbers',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('مَرْحَبًا بِكُمْ فِي كوجينا، حَيْثُ نَقُدِّمُ لَكُمْ تَجْرِبَةَ طَعَامٍ إِسْتِثْنَائِيَّةً عَبَرَ أَطْيَافِ مُتَعَدِّدَةٍ مِنَ المَأْكُولَاتِ الشَّهِيَّةِ وَالمُخْتَلِفَةِ',
                      textStyle: TextStyles.font20Black700Weight.copyWith(
                      height: 1,
                      color: Colors.blue.shade800,
                      fontSize: 17.sp,
                  ),textAlign: TextAlign.center),
                  TyperAnimatedText('مَرْحَبًا بِكُمْ فِي كوجينا، حَيْثُ نَقُدِّمُ لَكُمْ تَجْرِبَةَ طَعَامٍ إِسْتِثْنَائِيَّةً عَبَرَ أَطْيَافِ مُتَعَدِّدَةٍ مِنَ المَأْكُولَاتِ الشَّهِيَّةِ وَالمُخْتَلِفَةِ',
                                      textStyle: TextStyles.font20Black700Weight.copyWith(
                                      height: 1,
                                      color: Colors.blue.shade800,
                                      fontSize: 17.sp,
                                  ),textAlign: TextAlign.center),

                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
          Spacer(),
          CustomElevatedButton(
            borderRadius: 50,
            height: 45.h,
            width: MediaQuery.of(context).size.width*0.8,
              onTap:(){
              context.pushNamed(RoutesRestaurants.loginScreen);
              },
              buttonText: 'Sign In',
              fontSize: 18,
          ),
          verticalSpace(15),

          CustomElevatedButton(
            borderRadius: 50,
            height: 45.h,
            width: MediaQuery.of(context).size.width*0.8,
            onTap:(){
              context.pushNamed(RoutesRestaurants.registerScreen);

            },
            buttonText: 'Sign Up',
            fontSize: 18,
          ),

          verticalSpace(10),
          InkWell(
            onTap: (){
              context.pushNamed(RoutesRestaurants.layout,arguments: {'currentPage':0});
            },
            child: Text('Log in as guest',
            style: TextStyles.font16Black500Weight.copyWith(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
              color: AppColors.customGray
            ),
            ),
          ),

          verticalSpace(50),

        ],
      ),
    );
  }
}
