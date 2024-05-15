import 'package:cogina/presentation/component/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/global/styles/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;
  final double? borderRadius;
  final Color? fontColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? loadingColor;
  final bool? isLoading;

  const CustomElevatedButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    this.borderRadius,
    this.fontColor,
    this.fontSize,
    this.borderColor,
    this.backgroundColor,this.height, this.width, this.isLoading, this.loadingColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width??20,height?? 30), // Set your desired width and height
        elevation: 0,
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      ),
      child:
      isLoading==true?
       Center(child: CustomLoadingWidget(color: loadingColor??AppColors.whiteColor),):
      Text(
        buttonText,
        style: TextStyle(
          color: fontColor ?? AppColors.whiteColor,
          fontSize: fontSize ?? 13.sp,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
