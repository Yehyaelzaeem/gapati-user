import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';

class CustomElementsItem extends StatelessWidget {
   CustomElementsItem({super.key});
  bool switchValue =false;

  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 5)]
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        child: Column(
          children: [
            Row(
              children: [
                Text('تشكن برجر',style: TextStyles.font20Black700Weight,),
                const Spacer(),
                StatefulBuilder(builder: (context,setState) {
                  return Switch(
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                  );
                }),
              ],
            ),
            Row(
              children: [
                Text('برجر _ سندوتشات',style: TextStyles.font14White500Weight.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.customBlack
                ),),
                const Spacer(),
                Text('95 دينار',style: TextStyles.font18Black700Weight.copyWith(
                    fontSize: 16,
                    color: AppColors.backBlue2
                ),),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
