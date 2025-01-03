import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:delivego/core/helpers/extensions.dart';
import 'package:delivego/core/resources/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/assets_constant/images.dart';
import '../../../../core/global/fonts/app_fonts.dart';
import '../../../../core/global/styles/colors.dart';
import '../../../../core/global/styles/styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../main.dart';
import '../../../component/custom_elevated_button.dart';
import '../../../component/custom_logo.dart';
import '../register/register_cubit.dart';

class LogAsScreen extends StatelessWidget {
  const LogAsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
     children: [
       Column(
         children: [
           verticalSpace(50),
           Image.asset(AppImages.logo),
         ],
       ),
       Expanded(
         child: SizedBox(
           width: MediaQuery.of(context).size.width*0.8,
           child: DefaultTextStyle(
             style: const TextStyle(
               fontFamily: AppFonts.cairo,
               fontSize: 16.0,
             ),
             child: AnimatedTextKit(
               animatedTexts: [
                 TyperAnimatedText(
                     LocaleKeys.welcomeMes.tr(),
                     textStyle: TextStyles.font20Black700Weight.copyWith(
                       height: 2,
                       color:AppColors.whiteColor,
                       fontSize: 17.sp,
                     ),textAlign: TextAlign.center),
                 TyperAnimatedText(
                     LocaleKeys.welcomeMes.tr(),
                     textStyle: TextStyles.font20Black700Weight.copyWith(
                       height: 2,
                       color:AppColors.whiteColor,
                       fontSize: 17.sp,
                     ),textAlign: TextAlign.center),
               ],
               onTap: () {
                 print("Tap Event");
               },
             ),
           ),
         ),
       ),
       CustomElevatedButton(
         borderRadius: 50,
         height: 45.h,
         borderColor: Colors.white,
         width: MediaQuery.of(context).size.width*0.8,
         onTap:(){
           context.pushNamed(RoutesRestaurants.loginScreen);
         },
         buttonText: LocaleKeys.signIn.tr(),
         fontSize: 18,
       ),
       verticalSpace(15),
       CustomElevatedButton(
         borderColor: Colors.white,
         borderRadius: 30,
         height: 45.h,
         width: MediaQuery.of(context).size.width*0.8,
         onTap:(){
           RegisterCubit.get(context).changeType('register');
           context.pushNamed(RoutesRestaurants.registerScreen);
         },
         buttonText: LocaleKeys.signUp.tr(),
         fontSize: 18,
       ),
       verticalSpace(10),
       InkWell(
         onTap: (){
           context.pushNamed(RoutesRestaurants.layout,arguments: {'currentPage':0});
         },
         child: Text(LocaleKeys.logGuest.tr(),
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
