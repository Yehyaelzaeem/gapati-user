import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../../core/global/styles/colors.dart';
import '../../../../../../../core/global/styles/styles.dart';


class CustomCartTopWidget extends StatelessWidget {
  const CustomCartTopWidget({super.key, required this.title, required this.number, required this.iconData, required this.iconBackGround, this.size});
  final String title;
  final String number;
  final IconData iconData;
  final Color iconBackGround;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 90.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(width: 5.w,),
             CircleAvatar(
               radius: size??20,
              backgroundColor:iconBackGround,
              child: Icon(iconData,
              color: AppColors.whiteColor,
              ),
            ),
            SizedBox(width: 15.w,),
            Text(title,
              style: TextStyles.font16Black600Weight.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
            const Spacer(),
            Text(number,
              style: TextStyles.font16Black600Weight.copyWith(
                  color: AppColors.redColor.withOpacity(0.6)
              ),
            ),
            SizedBox(width: 20.w,),
          ],
        ),
      ),
    );
  }
}
