import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';

class CustomSandwichWidget extends StatelessWidget {
  const CustomSandwichWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.sandwichBackGround
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 12.h),
        child: Text('big mac beef \n 2 Pound',
        textAlign: TextAlign.center,
        style:TextStyles.font15CustomGray400Weight.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.primaryColor
        ) ,
        ),
      ),
    );
  }
}
