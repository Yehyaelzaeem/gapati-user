import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';

class CustomOfferWidget extends StatelessWidget {
  const CustomOfferWidget({super.key, required this.priceDiscount});
  final String priceDiscount;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.28,
        left:context.locale.languageCode==Locale('en').toString()? null:0,
        right:context.locale.languageCode==Locale('en').toString()? 0:null,
        child:
        Container(
          decoration:  BoxDecoration(
              color: AppColors.redColor,
              boxShadow: [BoxShadow(
                color: Colors.black38,
                blurRadius: 5,
                offset: Offset(1, 10),
              )],
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(context.locale.languageCode==Locale('en').toString()? 0.w:5.w,),
                bottomRight: Radius.circular(context.locale.languageCode==Locale('en').toString()? 0.w:5.w,),
                bottomLeft: Radius.circular(context.locale.languageCode==Locale('en').toString()? 5.w:0.w,),
                topLeft: Radius.circular(context.locale.languageCode==Locale('en').toString()? 5.w:0.w,),
              )),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 0.h)+ EdgeInsets.only(top: 5.h),
            child: Center(
                child: Text('${priceDiscount}%', style: TextStyles.font16Black600Weight.copyWith(color: AppColors.whiteColor),)),
          ),
        ));
  }
}
