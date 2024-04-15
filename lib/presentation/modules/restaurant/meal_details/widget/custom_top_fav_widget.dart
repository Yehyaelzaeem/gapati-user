import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/global/styles/colors.dart';

class CustomTopFavWidget extends StatelessWidget {
   CustomTopFavWidget({super.key});
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return  Positioned(
        top: 60.h,
        left:context.locale.languageCode==Locale('en').toString()? null:20.w,
        right:context.locale.languageCode==Locale('en').toString()? 20.w:null,
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.whiteColor.withOpacity(0.9),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 7,
                        offset: Offset(1, 5))
                  ]),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isFav = !isFav;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: isFav == true
                      ? const Icon(
                    Icons.favorite,
                    size: 18,
                    color: AppColors.redColor,
                  )
                      : const Icon(
                    Icons.favorite_border_rounded,
                    size: 18,
                    color: AppColors.customGray,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
