import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/helpers/spacing.dart';

class CustomNotificationItem extends StatelessWidget {
  const CustomNotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 25,
                child: Icon(Icons.notifications_active_outlined,weight: 10,color: Colors.white,size: 30,),
              ),
              horizontalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment',
                    style: TextStyles.font20Black700Weight.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    'Thank you! Your transaction is com',
                    style: TextStyles.font20Black700Weight.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.customGray,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
