import 'package:cogina/core/global/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomColumStepperBody extends StatelessWidget {
  const CustomColumStepperBody({super.key, required this.title, required this.text});
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
          style: TextStyles.font16Black600Weight,
          ),
          Text(text,
          style: TextStyles.font15CustomGray400Weight,
          ),
        ],
      ),
    );
  }
}
