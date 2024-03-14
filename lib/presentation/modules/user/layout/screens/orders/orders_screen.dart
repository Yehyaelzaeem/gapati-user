import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/presentation/modules/user/layout/screens/orders/widgets/custom_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../component/custom_app_bar.dart';



class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   const CustomAppBar(
        title: 'متاح الان',
        isBackButtonExist: false,
      ),
      body:   Container(
        color: AppColors.customWhite,
        child: Padding(
          padding: EdgeInsets.only(bottom: 60.h),
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomOrderItemWidget(),
                CustomOrderItemWidget(),
                CustomOrderItemWidget(),
              ],
            ),
          ),
        ),
      )
    );
  }
}
