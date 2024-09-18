
import 'package:delivego/core/helpers/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/global/styles/colors.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../domain/request_body/address_body.dart';
import '../../../../../../generated/locale_keys.g.dart';
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      verticalSpace(10),
                      CustomTextField(hintText: LocaleKeys.telephoneNumber.tr(),
                        controller: cubit.phoneController,
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
                      verticalSpace(20),
                      CustomTextField(hintText: LocaleKeys.address.tr(),
                        controller: cubit.addressController,
                        borderRadius: 50,
                        textInputAction: TextInputAction.next,
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
                      InkWell(
                        onTap: (){
                          AddressCubit addressCubit =AddressCubit.get(context);
                          if( addressCubit.lat!=null&&addressCubit.long!=null){
                            context.pushNamed(RoutesRestaurants.customGoogleMapScreen,
                                arguments: {'lat':addressCubit.lat!,'long':addressCubit.long});
                          }else{
                            addressCubit.getLocation(context).then((value) {
                              context.pushNamed(RoutesRestaurants.customGoogleMapScreen,
                                  arguments: {'lat':value.latitude,'long':value.longitude});
                            });
                          }

                        },
                        child: CustomTextField(
                          hintText: LocaleKeys.location.tr(),
                          controller: cubit.locationController,
                          enabled: false,
                          borderRadius: 50,
                          textInputAction: TextInputAction.done,
                          validationFunc: (value){
                            if (value == null || value.isEmpty) {
                              return LocaleKeys.locationMess.tr();
                            }
                            return null;
                          },
                          prefixIcon: Icon(Icons.location_on,color: AppColors.customGray,),
                          contentHorizontalPadding: 20.w,
                          hintColor:AppColors.customGray,
                          fillColor:AppColors.backGroundGray,
                          borderColor: AppColors.backGroundGray,

                        ),
                      ),
                      verticalSpace(20),
                      CustomTextField(hintText: LocaleKeys.note.tr(),
                        controller: cubit.noteController,
                        borderRadius: 20,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.multiline,
                        contentHorizontalPadding: 20.w,
                        contentVerticalPadding: 15,
                        maxLines: 6,
                        hintColor:AppColors.customGray,
                        fillColor:AppColors.backGroundGray,
                        borderColor: AppColors.backGroundGray,
                      ),
                      verticalSpace(40),
                      CustomElevatedButton(
                          isLoading: state is AddressLoadingState,
                          borderRadius: 50,
                          backgroundColor: buttonColor,
                          fontSize: 17,
                          width: MediaQuery.of(context).size.width*0.8,
                          height: 45,
                          fontColor: AppColors.whiteColor,
                          onTap: (){
                            if (formKey.currentState!.validate()) {
                              AddressBody addressBody=
                              AddressBody(addressNote: cubit.noteController.text, address: cubit.addressController.text, latitude: cubit.lat.toString()??'00', longitude: cubit.long.toString()??'00', phone: cubit.phoneController.text);
                              cubit.addAddress(addressBody: addressBody, context: context,pop: pop);
                            }

                          }, buttonText: buttonTitle),
                      verticalSpace(10),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
  }
}
