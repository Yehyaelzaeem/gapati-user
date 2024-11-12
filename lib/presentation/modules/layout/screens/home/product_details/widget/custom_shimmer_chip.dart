import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../core/global/styles/colors.dart';

class CustomShimmerChip extends StatelessWidget {
  const CustomShimmerChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: Shimmer.fromColors(
          enabled: true,
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child:  Container(
            child: ChoiceChip(
              avatar: Icon(Icons.crop_square,),
              label: Text('                 '),
              selectedColor: AppColors.primaryColor,
              disabledColor: AppColors.customGray,
              onSelected: (selected) {
              }, selected: false,
            ),
          )),
    );
  }
}
