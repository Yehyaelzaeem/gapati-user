import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/resources/resources.dart';
import 'package:cogina/core/routing/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseUserScreen extends StatelessWidget {
  const ChooseUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: Decorations.backGroundDecorationCircleBorderRadius(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 50.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(40),
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [AppColors.backRed1, AppColors.backBlue2],
                    ).createShader(bounds);
                  },
                  child:
                  Text('Choose User',style: TextStyles.font20Black700Weight.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    shadows:  [BoxShadow(color: Colors.blue.shade700,blurRadius: 5)],
                  ),),
                ),

                verticalSpace(40),
                InkWell(
                  onTap: (){
                    context.setLocale(const Locale('en'));
                    context.pushNamed(RoutesRestaurants.loginScreen);
                  },
                  child: Container(
                    width: double.infinity,
                    height: deviceHeight*0.2,
                    decoration: Decorations.backGroundDecorationButton().copyWith(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [BoxShadow(color: Colors.black38,blurRadius: 5)]
                    ),
                    child: Center(
                      child:
                      Text('Client',style: TextStyles.font20Black700Weight.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                      ),),

                  ),),
                ),
                verticalSpace(30),
                InkWell(
                  onTap: (){
                    context.setLocale(const Locale('ar'));
                    context.pushNamed(RoutesRestaurants.authScreen);
                  },
                  child: Container(
                    width: double.infinity,
                    height: deviceHeight*0.2,
                    decoration: Decorations.backGroundDecorationButton().copyWith(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [BoxShadow(color: Colors.black38,blurRadius: 5)]
                    ),
                    child: Center(
                      child:
                      Text('Restaurant',style: TextStyles.font20Black700Weight.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                      ),),

                    ),),
                ),

                verticalSpace(30),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    width: double.infinity,
                    height: deviceHeight*0.2,
                    decoration: Decorations.backGroundDecorationButton().copyWith(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [BoxShadow(color: Colors.black38,blurRadius: 5)]
                    ),
                    child: Center(
                      child:
                      Text('Delivery',style: TextStyles.font20Black700Weight.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                      ),),

                    ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
