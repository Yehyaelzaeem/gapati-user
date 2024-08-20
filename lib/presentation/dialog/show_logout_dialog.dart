

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:delivego/core/helpers/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../generated/locale_keys.g.dart';
import '../../core/assets_constant/images.dart';
import '../../core/global/styles/colors.dart';
import '../../core/global/styles/styles.dart';
import '../../core/helpers/spacing.dart';
import '../../core/routing/routes.dart';
import '../../domain/provider/local_auth_provider_cubit.dart';
import '../component/custom_elevated_button.dart';
import '../modules/auth/login/login_cubit.dart';
import 'base/simple_dialogs.dart';

Future<bool?> showLogoutDialog(BuildContext context) async {

  return await showQuestionDialog(
    context,
    dialogType: DialogType.info,
    btnTextPositive: LocaleKeys.no.tr(),
    btnTextNegative: LocaleKeys.yes.tr(),
    question: LocaleKeys.logOut.tr(),
    desc:LocaleKeys.logOutMes.tr() ,
    // tr(LocaleKeys.wantToSignOut),
    onNegativeClick: () async{
    BlocProvider.of<LocalAuthCubit>(context, listen: false).logOut(context);
    },
    onPositiveClick: () {},
  );
}

Future<bool?> showDeleteAccountDialog(BuildContext context) async {

  return await showQuestionDialog(
    context,
    dialogType: DialogType.error,
    btnTextPositive: LocaleKeys.no.tr(), 
    btnTextNegative: LocaleKeys.yes.tr(),
    question: LocaleKeys.deleteAccount.tr(),
    desc:LocaleKeys.deleteAccountMes.tr() ,
    // tr(LocaleKeys.wantToSignOut),
    onNegativeClick: () {
      BlocProvider.of<LocalAuthCubit>(context, listen: false).logOut(context);
    },
    onPositiveClick: () {},
  );
}

void showSignUpDialog({required BuildContext context,required String screenName}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent, // Set the background color to transparent
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Customize the background color here
            borderRadius: BorderRadius.circular(8.0), // You can adjust the border radius as needed
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(
                height: 300.h,
                width: 343.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppImages.signUp,
                      width: 291.w,
                      height: 217.h,
                    ),
                    verticalSpace(10),
                    Text(
                      LocaleKeys.logInFirst.tr(),
                      style: TextStyles.font15CustomGray400Weight.copyWith(
                          color: AppColors.customBlack,
                          fontWeight: FontWeight.w700,
                          fontSize: 17
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomElevatedButton(
                  width: 200.w,
                  height: 40.h,
                  onTap: (){
                    LoginCubit.get(context).visitorLocation(screenName: screenName).then((value) {
                      context.pushNamedAndRemoveUntil(RoutesRestaurants.logAsScreen, predicate: (route) => route.isFirst);
                    });
                  }, buttonText:  LocaleKeys.signUp.tr(),
                   ),
              ),
              const SizedBox(height: 30,)
            ],
          ),
        ),

      );
    },
  );

}

// _onLogoutPress(BuildContext context) {
//   BlocProvider.of<LocalAuthCubit>(context, listen: false).logOut().then((isLogOut) {
//     if (isLogOut) {
//       Navigator.pop(context);
//       NavigationService.pushNamedAndRemoveUntil(Routes.welcomeScreen);
//     }
//   });
