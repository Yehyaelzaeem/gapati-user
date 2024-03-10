import 'package:cogina/core/global/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/global/styles/styles.dart';

class CustomTextRowCartWidget extends StatelessWidget {
  const CustomTextRowCartWidget({super.key, required this.title, required this.text, this.horizontal, this.vertical});
  final String title;
  final String text;
  final double? horizontal;
  final double? vertical;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal??35.w,vertical:vertical?? 16.w),
      child: Row(
        children: [
          Text('$title:',
          style: TextStyles.font16Black600Weight,
          ),
          const Spacer(),
          Text(text,
            style: TextStyles.font16Black600Weight.copyWith(
              color: AppColors.redColor.withOpacity(0.5)
            ),
          ),
        ],
      ),
    );
  }
}
