import 'package:cogina/core/translations/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/global/styles/colors.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../domain/request_body/address_body.dart';
import '../../../../../component/custom_elevated_button.dart';
import '../../../../../component/custom_text_field.dart';
import '../../more/address/address_cubit.dart';

class CustomAddressWidget extends StatelessWidget {
  const CustomAddressWidget({super.key, required this.buttonTitle, this.buttonColor, this.pop});
  final String buttonTitle;
  final bool? pop;
  final Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    AddressCubit cubit =AddressCubit.get(context);
    return BlocConsumer<AddressCubit, AddressState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.whiteColor
            ),
            child: Padding(
              padding:EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    FittedBox(
                      child: Padding(
                        padding:  EdgeInsets.only(right: 10.w),
                        child: Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: cubit.typeAddress,
                              onChanged: (value) {
                                cubit.changeTypeOfAddress(value!);
                              },
                            ),
                             Text(LocaleKeys.myHome.tr()),
                            Radio(
                              value: 1,
                              groupValue:  cubit.typeAddress,
                              onChanged: (value) {
                                cubit.changeTypeOfAddress(value!);
                              },
                            ),
                            Text(LocaleKeys.work.tr()),
                            Radio(
                              value: 2,
                              groupValue:  cubit.typeAddress,
                              onChanged: (value) {
                                cubit.changeTypeOfAddress(value!);
                              },
                            ),
                             Text(LocaleKeys.other.tr()),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(10),
                    CustomTextField(hintText: LocaleKeys.telephoneNumber.tr(), controller: cubit.phoneController,
                      borderRadius: 50,
                      textInputType: TextInputType.number,
                      validationFunc: (value){
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.telephoneNumberMes.tr();
                        }
                        return null;
                      },
                      contentHorizontalPadding: 20.w,
                      fillColor:AppColors.backGroundGray,
                      borderColor: AppColors.backGroundGray,
                      hintColor:AppColors.customGray,
                    ),
                    verticalSpace(10),
                    CustomTextField(hintText: LocaleKeys.address.tr(), controller: cubit.addressController,
                      borderRadius: 50,
                      textInputAction: TextInputAction.done,
                      validationFunc: (value){
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.addressMes.tr();
                        }
                        return null;
                      },
                      contentHorizontalPadding: 20.w,
                      hintColor:AppColors.customGray,
                      fillColor:AppColors.backGroundGray,
                      borderColor: AppColors.backGroundGray,
                    ),
                    verticalSpace(20),
                    CustomElevatedButton(
                        isLoading: state is AddAddressLoadingState,
                        borderRadius: 50,
                        backgroundColor: buttonColor,
                        fontSize: 17,
                        width: MediaQuery.of(context).size.width*0.8,
                        height: 45,
                        fontColor: AppColors.whiteColor,
                        onTap: (){
                          if (formKey.currentState!.validate()) {
                            AddressBody addressBody=AddressBody(addressType: cubit.typeAddress.toString(), address: cubit.addressController.text, latitude: '32.1194242', longitude: '32.1194242');
                            cubit.addMainAddress(addressBody: addressBody, context: context,pop: pop);
                          }

                        }, buttonText: buttonTitle),
                    verticalSpace(10),
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}
