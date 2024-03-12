import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/routing/routes.dart';
import 'package:cogina/presentation/component/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterSuccessScreen extends StatelessWidget {
  const RegisterSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundGray,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(200),
           Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 80,
              child: Icon(Icons.check,size: 100,color: Colors.grey.shade700,),
            ),
          ),
          const Spacer(),
         Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.whiteColor
            ),
           child:
         Padding(
           padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
           child: Column(
             children: [
               Text('Account Created!',
                 style: TextStyles.font20Black700Weight,
               ),
               verticalSpace(10),
               Text('Your account had been created \n successfully. \n Please sign in to use your account \n and enjoy',
                 style: TextStyles.font16Black600Weight.copyWith(
                     fontWeight: FontWeight.w700,
                     color: AppColors.customGray
                 ),
                 textAlign: TextAlign.center,
               ),
               verticalSpace(30),
               CustomElevatedButton(
                   borderRadius: 50,
                   height: 40.h,
                   width: MediaQuery.of(context).size.width*0.65,
                   onTap: (){
                     context.pushReplacementNamed(RoutesRestaurants.loginScreen);
                   },
                   buttonText: 'Take me to sign in'),
             ],
           ),
         ),),
          verticalSpace(50),
        ],
      ),
    );
  }
}
