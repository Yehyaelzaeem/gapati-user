import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/component/custom_elevated_button.dart';
import 'package:cogina/presentation/component/custom_text_field.dart';
import 'package:cogina/presentation/modules/layout/screens/orders/rate/rate_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/custom_app_bar.dart';
import '../../../../../component/custom_rate.dart';
import '../../../../../component/rate_widget.dart';
import '../../../../../component/texts/black_texts.dart';
import '../../../../../component/texts/hint_texts.dart';

class RateScreen extends StatelessWidget {
  final int orderId;
  const RateScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
   var cubit = context.read<RateCubit>();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar:  CustomAppBar(
        title: LocaleKeys.rate.tr(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(100),
            BlackBoldText(
              label: LocaleKeys.doRate.tr(),),
            verticalSpace(20),
            HintSemiBoldText(
              label: LocaleKeys.selectRate.tr(),),
            verticalSpace(10),
            RateWidget(
              ignoreGestures: false,
              iconSize: 50,
              onRatingUpdate: (rate){
                print('rate');
                print(rate);
              },
            ),
            verticalSpace(30),
            CustomTextField(
              contentHorizontalPadding: 16.w,
              contentVerticalPadding: 10.h,
              borderColor: Colors.transparent,
                fillColor: Colors.grey.shade100,
                maxLines: 4,
                hintText: LocaleKeys.typing.tr(),
                controller: cubit.textEditingController),
            verticalSpace(80),
           CustomElevatedButton(
               width: MediaQuery.of(context).size.width*0.5,
               height: 40.h,
               onTap: (){},
               borderRadius: 8,
               fontSize: 20,
               buttonText: LocaleKeys.done.tr())

          ],
        ),
      ),
    );
  }
}
