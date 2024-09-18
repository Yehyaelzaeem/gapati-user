import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/global/styles/colors.dart';
import '../../../../../../../core/global/styles/styles.dart';

class CustomStepsOrderWidget extends StatelessWidget {
   CustomStepsOrderWidget({super.key, required this.text,  this.isDone=false});
  bool isDone;
 final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.18,
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           Divider(
            color:isDone==true? AppColors.primaryColor:AppColors.customGray.withOpacity(0.2),
            thickness: 7,
            indent: 2,
            endIndent: 2,
          ),
          Text(text,style: TextStyles.font20Black700Weight.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 10.sp,

          ),
          textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
