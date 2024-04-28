import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/global/styles/colors.dart';

class CustomTopBackWidget extends StatelessWidget {
  const CustomTopBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 60.h,
        left:context.locale.languageCode==Locale('en').toString()? 20.w:null,
        right:context.locale.languageCode==Locale('en').toString()? null:20.w,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.whiteColor.withOpacity(0.9),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 7,
                      offset: Offset(1, 5))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 25,
                color: Colors.grey,
              ),
            ),
          ),
        ));
  }
}
