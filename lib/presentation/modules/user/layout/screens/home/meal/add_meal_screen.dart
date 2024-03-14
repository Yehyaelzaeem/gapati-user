import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cogina/core/global/styles/colors.dart';
import '../../../../../../../core/resources/decoration.dart';
import '../../../../../../component/custom_elevated_button.dart';
import '../../../../../../component/custom_text_field.dart';


class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.backGroundGray,
      appBar:  const CustomAppBar(
        color: AppColors.backGroundGray,
        title: 'أضف وجبة',
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('  اسم الوجبة',
                style: TextStyles.font18Black700Weight.copyWith(
                  color: Colors.grey.shade700
                ),
                ),
                verticalSpace(10),
                CustomTextField(
                  contentHorizontalPadding: 30,
                  hintText: '',
                  hintStyle: TextStyles.font16Black500Weight.copyWith(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w600
                  ),
                  fillColor: AppColors.whiteColor,
                  controller: TextEditingController(),
                  borderRadius: 40,
                  borderColor: Colors.grey.shade400,
                ),
                verticalSpace(20),
                Text('  السعر',
                  style: TextStyles.font18Black700Weight.copyWith(
                      color: Colors.grey.shade700
                  ),
                ),
                verticalSpace(10),
                CustomTextField(
                  contentHorizontalPadding: 30,
                  hintText: '',
                  hintStyle: TextStyles.font16Black500Weight.copyWith(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w600
                  ),
                  fillColor: AppColors.whiteColor,
                  controller: TextEditingController(),
                  borderRadius: 40,
                  borderColor: Colors.grey.shade400,
                ),
                verticalSpace(20),
                Text('  القسم',
                  style: TextStyles.font18Black700Weight.copyWith(
                      color: Colors.grey.shade700
                  ),
                ),
                verticalSpace(10),
                CustomTextField(
                  contentHorizontalPadding: 30,
                  hintText: '',
                  hintStyle: TextStyles.font16Black500Weight.copyWith(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w600
                  ),
                  fillColor: AppColors.whiteColor,
                  controller: TextEditingController(),
                  borderRadius: 40,
                  borderColor: Colors.grey.shade400,
                ),
                verticalSpace(20),
                Text('  الاضافة',
                  style: TextStyles.font18Black700Weight.copyWith(
                      color: Colors.grey.shade700
                  ),
                ),
                verticalSpace(10),
                CustomTextField(
                  contentHorizontalPadding: 30,
                  hintText: '',
                  hintStyle: TextStyles.font16Black500Weight.copyWith(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w600
                  ),
                  fillColor: AppColors.whiteColor,
                  controller: TextEditingController(),
                  borderRadius: 40,
                  borderColor: Colors.grey.shade400,
                ),
                verticalSpace(20),
                Text('  سعر الاضافة',
                  style: TextStyles.font18Black700Weight.copyWith(
                      color: Colors.grey.shade700
                  ),
                ),
                verticalSpace(10),
                CustomTextField(
                  contentHorizontalPadding: 30,
                  hintText: '',
                  hintStyle: TextStyles.font16Black500Weight.copyWith(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w600
                  ),
                  fillColor: AppColors.whiteColor,
                  controller: TextEditingController(),
                  borderRadius: 40,
                  borderColor: Colors.grey.shade400,
                ),
                verticalSpace(20),
                Text('  الخصم',
                  style: TextStyles.font18Black700Weight.copyWith(
                      color: Colors.grey.shade700
                  ),
                ),
                verticalSpace(10),
                CustomTextField(
                  contentHorizontalPadding: 30,
                  hintText: '',
                  hintStyle: TextStyles.font16Black500Weight.copyWith(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w600
                  ),
                  fillColor: AppColors.whiteColor,
                  controller: TextEditingController(),
                  borderRadius: 40,
                  borderColor: Colors.grey.shade400,
                ),
                verticalSpace(20),
                Text('  الوصف',
                  style: TextStyles.font18Black700Weight.copyWith(
                      color: Colors.grey.shade700
                  ),
                ),
                verticalSpace(10),
                CustomTextField(
                  contentHorizontalPadding: 30,
                  hintText: '',
                  hintStyle: TextStyles.font16Black500Weight.copyWith(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w600
                  ),
                  fillColor: AppColors.whiteColor,
                  controller: TextEditingController(),
                  borderRadius: 40,
                  borderColor: Colors.grey.shade400,
                ),
                verticalSpace(25),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 12.h),
                      child: const Icon(Icons.photo,size: 80,color: Colors.grey,),
                    ),
                  ),
                ),
                verticalSpace(25),
                Center(
                  child: Container(
                    decoration: Decorations.backGroundDecorationButton().copyWith(
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: CustomElevatedButton(
                      backgroundColor: Colors.transparent,
                      onTap: (){
                      },
                      buttonText:'اضف',
                      width: MediaQuery.of(context).size.width*0.5,
                      height: 40,
                      fontSize: 17,
                      borderRadius: 40,
                    ),
                  ),
                ),
                verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
