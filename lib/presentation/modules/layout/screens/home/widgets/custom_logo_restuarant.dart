import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../component/images/custom_image.dart';

class CustomLogoRestaurant extends StatelessWidget {
  const CustomLogoRestaurant({super.key, this.height, this.width, this.image});
  final double? height;
  final double? width;
  final String? image;
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
            child: CustomImage(image: image!,radius: 50)

        )
    );
  }
}
