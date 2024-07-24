import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/routing/routes.dart';
import 'package:cogina/domain/logger.dart';
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
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/custom_elevated_button.dart';
import '../../../../../component/custom_loading_widget.dart';
import '../../more/address/address_cubit.dart';
import '../check_out/check_out_cubit.dart';
import 'custom_address_widget.dart';

class CustomStepBody1Widget extends StatelessWidget {
   CustomStepBody1Widget({super.key});
  int currentMethod=0;
  @override
  Widget build(BuildContext context) {
    AddressCubit cubit =AddressCubit.get(context);
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
                height: MediaQuery.of(context).size.height*0.65,
                child: Column(
                  children: [
                    Expanded(
                      child:
                      StatefulBuilder(builder: (context,setState){
                        return  ListView.builder(
                          itemCount: cubit.addressModel!.data!.length,
                          itemBuilder: (context,index){
                            var data =cubit.addressModel!.data![index];

                            return Padding(
                            padding:  EdgeInsets.symmetric(vertical: 10.h),
                            child: Container(
                              decoration: BoxDecoration(
                                  color:AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(8.sp)
                              ),
                              child:
                              Row(
                                children: [
                                  Radio(
                                    activeColor:AppColors.primaryColor,
                                    value: index,
                                    groupValue: currentMethod,
                                    onChanged: (value) {
                                      setState(() {
                                        cubit.orderAddress=data;
                                        currentMethod = value!;
                                      });
                                    },
                                  ),
                                  Text(data.address!),
                                ],
                              ),
                            ),
                          );
                        },
                        );
                      }),
                    ),
                    CustomElevatedButton(
                        height: 45,
                        borderRadius: 40,
                        fontSize: 17,
                        fontColor: AppColors.whiteColor,
                        width: MediaQuery.of(context).size.width*0.9,
                        onTap: (){
                          log('tag', cubit.orderAddress.toString());
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
