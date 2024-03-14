import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:flutter/material.dart';



class CustomVisaWidget extends StatelessWidget {
  const CustomVisaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.whiteColor
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 13.h),
        child: Row(
          children: [
            Text('Visa*********250',
              style: TextStyles.font16Black600Weight.copyWith(
                  color: AppColors.customGray,
                  fontWeight: FontWeight.w700
              ),
            ),
            const Spacer(),
            Text('Change',
              style: TextStyles.font16Black600Weight.copyWith(
                  color: AppColors.redColor.withOpacity(0.5),
                  fontWeight: FontWeight.w700
              ),
            ),
          ],
        ),
      ),
    );
  }
}
