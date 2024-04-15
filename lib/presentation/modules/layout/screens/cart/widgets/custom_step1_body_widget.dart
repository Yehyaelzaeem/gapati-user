import 'package:cogina/core/translations/locale_keys.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/cart_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/global/styles/colors.dart';
import '../../../../../../../core/global/styles/styles.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/function/function.dart';
import '../../../../../../core/helpers/toast_states/enums.dart';
import '../../../../../component/custom_elevated_button.dart';
import '../../home/home_cubit.dart';
import '../../more/address/address_cubit.dart';
import '../check_out/check_out_cubit.dart';
import 'custom_address_widget.dart';

class CustomStepBody1Widget extends StatelessWidget {
  const CustomStepBody1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    AddressCubit cubit =AddressCubit.get(context);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocConsumer<AddressCubit, AddressState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Column(
                    children: [
                      cubit.mainAddressModel!=null?
                      cubit.mainAddressModel!.data!.isNotEmpty?
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.whiteColor
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.w,vertical: 30.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(cubit.mainAddressModel!.data![0].addressType==0?LocaleKeys.myHomeAddress.tr():
                              cubit.mainAddressModel!.data![0].addressType==1?LocaleKeys.workAddress.tr():LocaleKeys.otherAddress.tr(),
                                style: TextStyles.font20Black700Weight,
                              ),
                              Text('${cubit.mainAddressModel!.data![0].addressTo}',
                                style: TextStyles.font15CustomGray400Weight,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ):const SizedBox.shrink():const SizedBox.shrink(),
                      verticalSpace(20),
                      CustomAddressWidget(buttonTitle: LocaleKeys.add.tr(),buttonColor: AppColors.buttonOrangeColor,pop: false,),
                      verticalSpace(30),
                      CustomElevatedButton(
                          height: 45,
                          borderRadius: 50,
                          fontSize: 17,
                          fontColor: AppColors.whiteColor,
                          width: MediaQuery.of(context).size.width*0.9,
                          onTap: (){
                            logInFirst(function: (){
                              if(cubit.mainAddressModel!=null){
                                CheckOutCubit.get(context).changeSteps(1);
                              }else{
                                showToast(text: LocaleKeys.mesAddress.tr(), state: ToastStates.error, context: context);
                              }
                            }, context: context);



                          },
                          buttonText: LocaleKeys.continueButton.tr())

                    ],
                  );
              },
            ),
    );
  }
}
