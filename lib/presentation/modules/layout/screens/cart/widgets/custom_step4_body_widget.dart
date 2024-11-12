
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/function/function.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/helpers/toast_states/enums.dart';
import '../../../../../../domain/request_body/check_out_body.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/custom_elevated_button.dart';
import '../../more/address/address_cubit.dart';
import '../check_out/check_out_cubit.dart';
import 'custom_visa_widget.dart';


class CustomStepBody4Widget extends StatelessWidget {
   const CustomStepBody4Widget({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutCubit cubit =CheckOutCubit.get(context);
    String selectedRadioValue = '0';

    return
     StatefulBuilder(builder: (context, setState) {
       return  Column(
         children: [
           // const CustomVisaWidget(),
           verticalSpace(15),
           Container(
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(50),
                 color: AppColors.whiteColor
             ),
             child: Row(
               children: [
                 Radio(
                   value: '0',
                   groupValue: selectedRadioValue,
                   onChanged: (value) {
                     setState(() {
                       selectedRadioValue = value.toString();
                     });
                   },
                 ),
                 Text(LocaleKeys.cash.tr(),
                   style: TextStyles.font16Black600Weight.copyWith(
                       color: AppColors.customGray,
                       fontWeight: FontWeight.w700
                   ),
                 ),
                 // const Spacer(),
                 // const Icon(Icons.arrow_forward_ios_outlined),
                 // horizontalSpace(10)
               ],
             ),
           ),
           verticalSpace(15),
           Container(
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(50),
                 color: AppColors.whiteColor
             ),
             child: Row(
               children: [
                 Radio(
                   value: '1',
                   groupValue: selectedRadioValue,
                   onChanged: (value) {
                     setState(() {
                       selectedRadioValue = value.toString();
                     });
                   },
                 ),
                 Text(LocaleKeys.creditCard.tr(),
                   style: TextStyles.font16Black600Weight.copyWith(
                     color: AppColors.customGray,
                     fontWeight: FontWeight.w700,
                   ),
                 ),
                 // const Spacer(),
                 // const Icon(Icons.arrow_forward_ios_outlined),
                 // horizontalSpace(10)
               ],
             ),
           ),
           // Container(
           //   decoration: BoxDecoration(
           //       borderRadius: BorderRadius.circular(50),
           //       color: AppColors.backGroundPink2
           //   ),
           //   child: Padding(
           //     padding: EdgeInsets.symmetric(horizontal: 90.w,vertical: 13.h),
           //     child:
           //     Text(LocaleKeys.addMethod.tr(),
           //       style: TextStyles.font16Black600Weight.copyWith(
           //           color: AppColors.buttonOrangeColor,
           //           fontWeight: FontWeight.w700
           //       ),
           //     ),
           //   ),
           // ),
           SizedBox(height: MediaQuery.of(context).size.height*0.4 ,),

           Center(
             child: BlocConsumer<CheckOutCubit, CheckOutState>(
               listener: (context, state) {},
               builder: (context, state) {
                 return CustomElevatedButton(
                     height: 45,
                     loadingColor: AppColors.whiteColor,
                     isLoading: state is CheckOutLoadingState,
                     borderRadius: 50,
                     width: MediaQuery.of(context).size.width*0.77,
                     fontSize: 17,
                     fontColor: AppColors.whiteColor,
                     onTap: (){
                       cubit.sendCheckOutData(context);
                     }, buttonText: LocaleKeys.payNow.tr());
               },
             ),
           ),
           verticalSpace(40),
         ],
       );
     });
  }
}