import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/global/styles/colors.dart';
import '../../../../core/global/styles/styles.dart';
import 'custom_best_meals_widgets.dart';
import 'custom_meal_widget.dart';
class CategoriesRestaurantShimmer extends StatelessWidget {
  const CategoriesRestaurantShimmer({Key? key, this.height}) : super(key: key);
  final double? height;
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width: double.infinity,
        height: height?? 110.w,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            itemCount:6 ,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Shimmer.fromColors(
                    enabled: true,
                    baseColor:  Colors.grey[300]! ,
                    highlightColor:  Colors.grey[100]!,
                    child:
                    Container(
                      decoration:  BoxDecoration(
                          color: AppColors.customWhite,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      height: 130.h,
                      width: double.infinity,
                    )
                ),
              );
            }),
      );
  }
}