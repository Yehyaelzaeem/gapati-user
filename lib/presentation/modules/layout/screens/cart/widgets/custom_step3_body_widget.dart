import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../component/custom_elevated_button.dart';
import 'custom_visa_widget.dart';


class CustomStepBody3Widget extends StatelessWidget {
   const CustomStepBody3Widget({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedRadioValue = '';

    setSelectedRadioValue(String value) {
      selectedRadioValue = value;
    }
    return
      Column(
        children: [
          const CustomVisaWidget(),
          verticalSpace(15),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.whiteColor
            ),
            child: Row(
              children: [
                Radio(
                  value: true,
                  groupValue: selectedRadioValue,
                  onChanged: (value) {
                    setSelectedRadioValue(value.toString());
                  },
                ),
                Text('Credit/Debit/ATM Card',
                  style: TextStyles.font16Black600Weight.copyWith(
                      color: AppColors.customGray,
                      fontWeight: FontWeight.w700
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios_outlined),
                horizontalSpace(10)
              ],
            ),
          ),
          verticalSpace(15),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.backGroundPink2
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 90.w,vertical: 13.h),
              child:
              Text('Add Payment Method',
                style: TextStyles.font16Black600Weight.copyWith(
                    color: AppColors.buttonOrangeColor,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.4 ,),

          Center(
            child: CustomElevatedButton(
                height: 45,
                borderRadius: 50,
                width: MediaQuery.of(context).size.width*0.77,
                fontSize: 17,
                fontColor: AppColors.whiteColor,
                onTap: (){}, buttonText: 'Play Now'),
          ),
          verticalSpace(40),
        ],
      );
  }
}