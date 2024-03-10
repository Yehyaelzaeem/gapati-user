import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../component/custom_elevated_button.dart';
import '../../../../../component/custom_text_field.dart';

class CustomAddressWidget extends StatelessWidget {
  const CustomAddressWidget({super.key, required this.buttonTitle, this.buttonColor});
  final String buttonTitle;
  final Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor
      ),
      child: Padding(
        padding:EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        child: Column(
          children: [
            CustomTextField(hintText: 'Recipient name', controller: TextEditingController(),
              borderRadius: 50,
              contentHorizontalPadding: 20.w,
              fillColor:AppColors.backGroundGray,
              borderColor: AppColors.backGroundGray,
              hintColor:AppColors.customGray,
            ),
            verticalSpace(10),
            CustomTextField(hintText: 'Telephone number', controller: TextEditingController(),
              borderRadius: 50,
              contentHorizontalPadding: 20.w,
              fillColor:AppColors.backGroundGray,
              borderColor: AppColors.backGroundGray,
              hintColor:AppColors.customGray,
            ),
            verticalSpace(10),
            CustomTextField(hintText: 'Address', controller: TextEditingController(),
              borderRadius: 50,
              contentHorizontalPadding: 20.w,
              hintColor:AppColors.customGray,
              fillColor:AppColors.backGroundGray,
              borderColor: AppColors.backGroundGray,
            ),
            verticalSpace(20),
            CustomElevatedButton(
                borderRadius: 50,
                backgroundColor: buttonColor,
                fontSize: 17,
                width: MediaQuery.of(context).size.width*0.8,
                height: 45,
                fontColor: AppColors.whiteColor,
                onTap: (){
                }, buttonText: buttonTitle)
          ],
        ),
      ),
    );
  }
}
