import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/presentation/modules/notification/widgets/custom_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/global/styles/styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
           Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        backgroundColor:  AppColors.whiteColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Notification',
          style: TextStyles.font20Black700Weight.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          CustomNotificationItem(),
          CustomNotificationItem(),
          CustomNotificationItem(),
          CustomNotificationItem(),
        ],
      ),
    );
  }
}
