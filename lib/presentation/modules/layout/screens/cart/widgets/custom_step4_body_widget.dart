import 'package:cogina/core/translations/locale_keys.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/check_out/check_out_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/function/function.dart';
import '../../../../../../domain/request_body/check_out_body.dart';
import '../../../../../component/custom_elevated_button.dart';
import '../../more/address/address_cubit.dart';
import 'custom_visa_widget.dart';


class CustomStepBody4Widget extends StatelessWidget {
   const CustomStepBody4Widget({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutCubit cubit =CheckOutCubit.get(context);
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
                Text(LocaleKeys.creditCard.tr(),
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
              Text(LocaleKeys.addMethod.tr(),
                style: TextStyles.font16Black600Weight.copyWith(
                    color: AppColors.buttonOrangeColor,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
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
                          logInFirst(function: (){
                            CheckOutBody checkOutBody=CheckOutBody(paymentMethod: 'cash', address: AddressCubit.get(context).mainAddressModel!.data![0].addressTo, latitude: '32.1194242', longitude: '20.1861500');
                            cubit.checkOut(checkOutBody: checkOutBody, context: context);
                          }, context: context);

                        }, buttonText: LocaleKeys.payNow.tr());
                  },
                  ),
          ),
          verticalSpace(40),
        ],
      );
  }
}