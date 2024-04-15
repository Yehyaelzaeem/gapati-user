import 'package:cogina/core/global/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitleTabBarWidget extends StatelessWidget {
  const CustomTitleTabBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: FittedBox(
            child: Text(title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyles.font18Black700Weight.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20
              )
            ),
          ),
        ),
      ),
    );
  }
}
