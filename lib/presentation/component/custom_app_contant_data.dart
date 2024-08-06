import 'package:cogina/core/assets_constant/images.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/presentation/component/custom_logo.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/global/styles/styles.dart';
import '../../core/helpers/spacing.dart';
import '../../main.dart';

class CustomAppContData extends StatelessWidget {
  const CustomAppContData({super.key, required this.image, required this.des});
 final String image;
 final String des;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h,),
          Center(
            child: SizedBox(
                height: 130.w,
                width: 130.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child:
                  Image.asset(AppImages.logoW2)
                )),
          ),
          SizedBox(height: 35.h,),
          Text(
           LocaleKeys.appName.tr(),
            style: TextStyles.font18Black700Weight.copyWith(
                color: AppColors.black
            ),),
          verticalSpace(16),
          Text(
            des,
            style: TextStyles.font15CustomGray400Weight.copyWith(
                color: AppColors.customGray,
              fontWeight: FontWeight.w700
            ),
          textAlign: TextAlign.start,),
        ],
      ),
    );
  }
}
