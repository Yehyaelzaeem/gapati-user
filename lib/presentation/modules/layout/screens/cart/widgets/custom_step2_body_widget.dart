
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/custom_elevated_button.dart';
import '../check_out/check_out_cubit.dart';



class CustomStepBody2Widget extends StatelessWidget {
   const CustomStepBody2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutCubit cubit =CheckOutCubit.get(context);
    return
      Column(
      children: [
              Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.whiteColor
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${LocaleKeys.free.tr()} _ 0.00${LocaleKeys.lyd.tr()}',
                    style: TextStyles.font16Black600Weight.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.redColor.withOpacity(0.5)
                    ),) ,
                    // Text('3-5 ${LocaleKeys.dayDelivery.tr()}',
                    // style: TextStyles.font16Black600Weight.copyWith(
                    //   color: AppColors.customGray,
                    //   fontWeight: FontWeight.w700
                    // ),
                    // ),
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(Icons.check,color: AppColors.whiteColor,),
                )
              ],
            ),
          ),
        ),
              SizedBox(height: MediaQuery.of(context).size.height*0.45,),
              Text(LocaleKeys.mesDelivery.tr(),
                  style: TextStyles.font16Black600Weight.copyWith(
                  color: AppColors.customGray,
                  fontWeight: FontWeight.w700
                  ),
              textAlign: TextAlign.center,
              ),
        verticalSpace(20),
        Center(
          child: CustomElevatedButton(
              height: 45,
              borderRadius: 50,
              width: MediaQuery.of(context).size.width*0.77,
              fontSize: 17,
              fontColor: AppColors.whiteColor,
              onTap: (){
                cubit.changeSteps(2);

              }, buttonText:LocaleKeys.continue2.tr()),
        ),
        verticalSpace(40),
      ],
    );

  }

}