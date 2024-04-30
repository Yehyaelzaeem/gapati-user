
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/font_manager.dart';
import '../fonts/app_fonts.dart';
import 'colors.dart';

class TextStyles{


  static TextStyle font14White500Weight =  const TextStyle(
      fontSize: 14,
      fontFamily: AppFonts.Tajawal,

      fontWeight: FontWeight.w500,
      color: Colors.white
  );  static TextStyle font16Black500Weight = const TextStyle(
      fontFamily: AppFonts.Tajawal,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black
  );
  static TextStyle font10CustomGray400Weight = const TextStyle(
      fontFamily:  AppFonts.Tajawal,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.customGray
  );
  static TextStyle font18Black700Weight = const TextStyle(
      fontSize: 18,
      fontFamily:  AppFonts.Tajawal,
      fontWeight: FontWeight.w700,
      color: Colors.black
  );
  static TextStyle font15CustomGray400Weight = const TextStyle(
      fontSize: 15,
      fontFamily:  AppFonts.Tajawal,

      fontWeight: FontWeight.w400,
      color: AppColors.customGray
  );
  static TextStyle font16Black600Weight =  const TextStyle(
      fontSize: 16,
      fontFamily: AppFonts.Tajawal,

      fontWeight: FontWeight.w600,
      color: Colors.black
  );
  static TextStyle font20Black700Weight =  TextStyle(
      fontSize: 20.sp,
      fontFamily:  AppFonts.Tajawal,
      fontWeight: FontWeight.w700,
      color: Colors.black
  );


}