
import 'dart:developer';

import 'package:delivego/core/global/fonts/app_fonts.dart';
import 'package:delivego/core/helpers/extensions.dart';
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
import '../../../../../../core/routing/routes.dart';
import '../../../../../../data/model/response/address_model.dart';
import '../../../../../../data/model/response/delivery_fees_params.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/custom_elevated_button.dart';
import '../../../../../component/custom_loading_widget.dart';
import '../../../../../component/custom_text_field.dart';
import '../../../../../component/texts/black_texts.dart';
import '../../more/address/address_cubit.dart';
import '../cart_cubit.dart';
import '../check_out/check_out_cubit.dart';
import 'custom_address_widget.dart';

class CustomStepBody1Widget extends StatelessWidget {
   CustomStepBody1Widget({super.key});
  @override
  Widget build(BuildContext context) {
    AddressCubit cubit =AddressCubit.get(context);
    CheckOutCubit checkOutCubit =CheckOutCubit.get(context);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child:
      BlocConsumer<AddressCubit,AddressState>(
        builder: (BuildContext context ,AddressState state){
          return
            cubit.addressModel !=null?
            cubit.addressModel!.data!.length==0?
            Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35),
              child: Column(
                children: [
                  Center(child: Text(LocaleKeys.notFoundAddress.tr()),),
                  verticalSpace(10),
                  CustomElevatedButton(
                      backgroundColor: AppColors.whiteColor,
                      borderColor: AppColors.customGray,
                      fontColor: AppColors.primaryColor,
                      borderRadius: 8,
                      onTap: (){
                        context.pushNamed(RoutesRestaurants.addAddressScreen);
                      },
                      buttonText: LocaleKeys.addAddress.tr())
                ],
              ),
            ):
              Container(
                // height: MediaQuery.of(context).size.height*0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlackBoldText(
                      label: LocaleKeys.notes.tr(),
                      fontSize: 12.sp,
                    ),
                    verticalSpace(10),
                    CustomTextField(
                      contentVerticalPadding: 16,
                      contentHorizontalPadding: 16,
                      hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                      fillColor: AppColors.greyColor.withOpacity(0.3),
                      borderColor: AppColors.whiteColor.withOpacity(0.0),
                      borderRadius: 12,
                      maxLines: 4,
                      hintText: '',
                      hintColor: AppColors.black,
                      controller: checkOutCubit.notesController,),
                     verticalSpace(16),
                    BlackBoldText(
                      label: LocaleKeys.location.tr(),
                      fontSize: 12.sp,
                    ),
                    verticalSpace(10),
                     Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.customGray.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 0.5),
                            ),
                          ],
                          color: cubit.selectedAddressValue=='0'?
                          AppColors.whiteColor:AppColors.whiteColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8.sp)
                      ),
                      child:  Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio<String>(
                            value: '0',
                            groupValue: cubit.selectedAddressValue,
                            onChanged: (String? newValue) {
                              // print('newValue $newValue');
                              // if(newValue!=null){
                              //   cubit.getLocation(context).then((value) {
                              //     cubit.changeSelectedAddress(AddressModelData(
                              //       id: 0,
                              //       lat: value.latitude.toString()??'0.0',
                              //       lng: value.longitude.toString()??'0.0',
                              //       address: cubit.addressTitle??'',
                              //       phone: '',
                              //       addressToNote: '',
                              //
                              //     ),context);
                              //   });

                              // }
                            },
                          ),
                          Text('${LocaleKeys.currentLocation.tr()}',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: AppFonts.lateefFont,
                                  fontWeight: FontWeight.bold)),

                        ],
                      ),
                    ),
                     verticalSpace(10),
                     ...cubit.addressModel!.data!.map((data) =>  Padding(
                       padding:  EdgeInsets.symmetric(vertical: 10.h),
                       child: Container(
                         decoration: BoxDecoration(
                             boxShadow: [
                               BoxShadow(
                                 color: AppColors.customGray.withOpacity(0.5),
                                 spreadRadius: 1,
                                 blurRadius: 1,
                                 offset: Offset(0, 0.5),
                               ),
                             ],
                             color:
                             data.id!.toString()==cubit.selectedAddressValue?
                             AppColors.whiteColor:AppColors.whiteColor.withOpacity(0.5),
                             borderRadius: BorderRadius.circular(8.sp)
                         ),
                         child:
                         Row(
                           children: [
                             Radio(
                               activeColor:AppColors.primaryColor,
                               value: data.id!.toString(),
                               groupValue:  cubit.selectedAddressValue,
                               onChanged: (value) {
                                 // setState(() {
                                 //   cubit.orderAddress=data;
                                 //   currentMethod = value!;
                                 // });
                               },
                             ),
                             Text(data.address!,
                                 style: TextStyle(
                                     fontSize: 12.sp,
                                     fontFamily: AppFonts.lateefFont,
                                     fontWeight: FontWeight.bold )
                             ),
                           ],
                         ),
                       ),
                     )),
                    verticalSpace(16),

                    // Expanded(
                    //   child:
                    //   StatefulBuilder(builder: (context,setState){
                    //     // ...cubit.addressModel!.data!.map((e) =>);
                    //     return  ListView.builder(
                    //       itemCount: cubit.addressModel!.data!.length,
                    //       itemBuilder: (context,index){
                    //         var data =cubit.addressModel!.data![index];
                    //         return
                    //     Padding(
                    //         padding:  EdgeInsets.symmetric(vertical: 10.h),
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             boxShadow: [
                    //               BoxShadow(
                    //                 color: AppColors.customGray.withOpacity(0.5),
                    //                 spreadRadius: 1,
                    //                 blurRadius: 1,
                    //                 offset: Offset(0, 0.5),
                    //               ),
                    //             ],
                    //               color:
                    //               data.id!.toString()==cubit.selectedAddressValue?
                    //               AppColors.whiteColor:AppColors.whiteColor.withOpacity(0.5),
                    //               borderRadius: BorderRadius.circular(8.sp)
                    //           ),
                    //           child:
                    //           Row(
                    //             children: [
                    //               Radio(
                    //                 activeColor:AppColors.primaryColor,
                    //                 value: data.id!.toString(),
                    //                 groupValue:  cubit.selectedAddressValue,
                    //                 onChanged: (value) {
                    //                   // setState(() {
                    //                   //   cubit.orderAddress=data;
                    //                   //   currentMethod = value!;
                    //                   // });
                    //                 },
                    //               ),
                    //               Text(data.address!,
                    //               style: TextStyle(
                    //                   fontSize: 12.sp,
                    //                   fontFamily: AppFonts.lateefFont,
                    //                   fontWeight: FontWeight.bold )
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //     );
                    //   }),
                    // ),
                    CustomElevatedButton(
                        height: 45,
                        borderRadius: 12,
                        fontSize: 17,
                        fontColor: AppColors.whiteColor,
                        width: MediaQuery.of(context).size.width*0.9,
                        onTap: (){
                          CartCubit cartCubit =CartCubit.get(context);
                          AddressCubit addressCubit =AddressCubit.get(context);
                          CheckOutCubit  checkOutCubit=CheckOutCubit.get(context);
                          checkOutCubit.getDeliveryFees(params: DeliveryFeesParams(addressId: addressCubit.orderAddress?.id?.toString()??'',branchId: cartCubit.products[0].branchId!=null?cartCubit.products[0].branchId!.toString():"0"));
                          CheckOutCubit.get(context).changeSteps(1);
                        },
                        buttonText: LocaleKeys.continue2.tr())
                  ],
                ),
              ) :
            Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35),
              child: CustomLoadingWidget(),
            );
        },
        listener: (BuildContext context ,AddressState state){},
      )

    );
  }
}
