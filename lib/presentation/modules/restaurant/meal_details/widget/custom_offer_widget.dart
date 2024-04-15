import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';

class CustomOfferWidget extends StatelessWidget {
  const CustomOfferWidget({super.key, required this.priceDiscount});
  final String priceDiscount;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.30,
        left:context.locale.languageCode==Locale('en').toString()? null:0,
        right:context.locale.languageCode==Locale('en').toString()? 0:null,
        child: Container(
          decoration:  BoxDecoration(
              color: AppColors.redColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(context.locale.languageCode==Locale('en').toString()? 0.w:8.w,),
                bottomRight: Radius.circular(context.locale.languageCode==Locale('en').toString()? 0.w:8.w,),
                bottomLeft: Radius.circular(context.locale.languageCode==Locale('en').toString()? 8.w:0.w,),
                topLeft: Radius.circular(context.locale.languageCode==Locale('en').toString()? 8.w:0.w,),
              )),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.h),
            child: Center(
                child: Text('${priceDiscount}%', style: TextStyles.font16Black600Weight.copyWith(color: AppColors.whiteColor),)),
          ),
        ));
  }
}
