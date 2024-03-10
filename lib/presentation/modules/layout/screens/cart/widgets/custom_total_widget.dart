import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
class CustomTotalWidget extends StatelessWidget {
  const CustomTotalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
        Text('Total Amount',
        style: TextStyles.font16Black600Weight.copyWith(
            fontWeight: FontWeight.bold
        ),),
          const Spacer(),
          Text('\$250',
            style: TextStyles.font16Black600Weight.copyWith(
                color: AppColors.redColor.withOpacity(0.6)
            ),
          ),
          SizedBox(width: 10.w,),
        ],
      ),
    );
  }
}
