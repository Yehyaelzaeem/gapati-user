import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../component/custom_elevated_button.dart';
import 'custom_address_widget.dart';

class CustomStepBody1Widget extends StatelessWidget {
  const CustomStepBody1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.whiteColor
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w,vertical: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('MyHome #1',
                    style: TextStyles.font20Black700Weight,
                  ),
                  Text('3001 Bishop Dr # 300 San \n Ramon CA California',
                    style: TextStyles.font15CustomGray400Weight,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(20),
          const CustomAddressWidget(buttonTitle: 'Add',buttonColor: AppColors.buttonOrangeColor,),
          verticalSpace(30),
          CustomElevatedButton(
              height: 45,
              borderRadius: 50,
              fontSize: 17,
              fontColor: AppColors.whiteColor,
              width: MediaQuery.of(context).size.width*0.9,
              onTap: (){},
              buttonText: 'Continue')

        ],
      ),
    );
  }
}
