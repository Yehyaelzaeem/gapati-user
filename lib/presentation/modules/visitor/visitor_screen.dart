
import 'package:delivego/core/helpers/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/assets_constant/images.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../main.dart';
import '../../component/custom_elevated_button.dart';
import '../auth/login/login_cubit.dart';

class CustomVisitorScreen extends StatelessWidget {
  const CustomVisitorScreen({super.key, required this.screenName});
  final String screenName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(AppImages.logo,
            height: MediaQuery.of(context).size.height*0.2,
            ),
            verticalSpace(5),
            Text(LocaleKeys.logInFirst.tr(),
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                // fontFamily: AppFontsFamily.fontCairo,
              ),
            ),
            SizedBox(height: 50.h,),
            CustomElevatedButton(
              height: 40.h,
              width: 200.w,
              onTap: (){
                LoginCubit.get(context).visitorLocation(screenName: screenName).then((value) {
                  context.pushNamedAndRemoveUntil(RoutesRestaurants.logAsScreen, predicate: (route) => route.isFirst);
                });

            }, buttonText:LocaleKeys.signUp.tr(), ),
          ],
        ),
      ),
    );
  }
}
