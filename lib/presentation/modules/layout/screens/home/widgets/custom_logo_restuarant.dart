import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';

class CustomLogoRestaurant extends StatelessWidget {
  const CustomLogoRestaurant({super.key, this.height, this.width});
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height?? 90.w,
        width:width?? 90.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.customBluColor,
        ),
        child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            child: CircleAvatar(
              backgroundColor: const Color(0xffD52B1E),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Image.asset(RestaurantImages.mc,
                  fit: BoxFit.cover,),
              ),
            )

        )
    );
  }
}
