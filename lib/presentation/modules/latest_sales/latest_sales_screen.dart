import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../component/custom_app_bar.dart';
import '../layout/screens/home/widgets/custom_product_item_widget.dart';
import '../restaurant/widgets/custom_restaurant_widget.dart';

class LatestSalesScreen extends StatelessWidget {
  const LatestSalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Latest Sales',
        ),
    );
  }
}
/*
GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 9.w,
            mainAxisSpacing: 15.h,
            mainAxisExtent: 260.h,
          ),
          itemBuilder: (BuildContext context, int index) {
            return  const FittedBox(child: CustomProductItemWidget(inHome: false,));

          },
          shrinkWrap: true,
          itemCount: 10,
          padding: EdgeInsets.all(16.w),
        )
 */