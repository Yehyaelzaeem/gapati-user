import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../data/model/response/delivery_fees_params.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/custom_elevated_button.dart';
import '../../../../../component/texts/black_texts.dart';
import '../../more/address/address_cubit.dart';
import '../cart_cubit.dart';
import '../check_out/check_out_cubit.dart';
import 'custom_cart_item.dart';
import 'custom_cart_top_widget.dart';
import 'custom_text_row_cart.dart';

class CustomStepBody3Widget extends StatelessWidget {
  const CustomStepBody3Widget({super.key});

  @override
  Widget build(BuildContext context) {
    CartCubit cubit = CartCubit.get(context);
    AddressCubit addressCubit = AddressCubit.get(context);
    CheckOutCubit checkOutCubit = CheckOutCubit.get(context);
    // checkOutCubit.getDeliveryFees(params: DeliveryFeesParams(addressId: addressCubit.orderAddress?.id?.toString()??'',branchId: cubit.products[0].branchId!=null?cubit.products[0].branchId!.toString():"0"));
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(10),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CustomCartTopWidget(
                          title: LocaleKeys.inCart.tr(),
                          number: cubit.products.isNotEmpty
                              ? cubit.products.length.toString()
                              : '0',
                          iconData: Icons.shopping_cart_outlined,
                          iconBackGround: AppColors.primaryColor,
                          size: 25,
                        ),
                        verticalSpace(10),
                        if (cubit.products.isNotEmpty)
                          ...cubit.products.map((e) => CustomCartItem(
                                product: e,
                                hasShadow: true,
                                height: 130.h,
                                imageWidth: 110.w,
                                chipRadius: 10,
                                chipHeight: 30.h,
                                storeId: e.storeId!.toString(),
                              ))
                        else
                          const SizedBox.shrink(),
                      ],
                    ),
                    BlocConsumer<AddressCubit, AddressState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Column(
                          children: [
                            CustomCartTopWidget(
                              title:
                                  '${addressCubit.addressController.text.isNotEmpty ? addressCubit.addressController.text : addressCubit.orderAddress?.address?.toString() ?? ''}',
                              number: '',
                              iconData: Icons.delivery_dining_outlined,
                              iconBackGround: AppColors.buttonOrangeColor,
                              size: 25,
                            ),
                            //
                            // if(addressCubit.addressController.text.isNotEmpty)
                            //   Padding(
                            //     padding:EdgeInsets.symmetric(horizontal: 25.w),
                            //     child: Text(addressCubit.addressController.text,
                            //       style: TextStyles.font15CustomGray400Weight,),
                            //   )
                            // else
                            //   addressCubit.orderAddress!=null?
                            //   Padding(
                            //     padding:EdgeInsets.symmetric(horizontal: 25.w),
                            //     child: Text(addressCubit.orderAddress!.address.toString(),
                            //       style: TextStyles.font15CustomGray400Weight,),
                            //   ):
                            //   SizedBox.shrink(),
                          ],
                        );
                      },
                    ),
                    if (checkOutCubit.notesController.text.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            BlackBoldText(
                              label: '${LocaleKeys.notes.tr()} : ',
                              fontSize: 12.sp,
                            ),
                            horizontalSpace(5),
                            BlackBoldText(
                              label:
                                  '    ${checkOutCubit.notesController.text}',
                              fontSize: 12.sp,
                            ),
                          ],
                        ),
                      ),
                    verticalSpace(20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.backGroundGray),
                          child: CustomTextRowCartWidget(
                              horizontal: 20,
                              vertical: 13,
                              title: LocaleKeys.standard.tr(),
                              text:
                                  '${cubit.totalPrice().toStringAsFixed(1)} ${LocaleKeys.lyd.tr()}')),
                    ),
                    verticalSpace(30),
                    BlocConsumer<CheckOutCubit, CheckOutState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              CustomTextRowCartWidget(
                                  title: LocaleKeys.subtotal.tr(),
                                  text:
                                      '${cubit.totalPrice().toStringAsFixed(1)} ${LocaleKeys.lyd.tr()}'),
                              // CustomTextRowCartWidget(title: LocaleKeys.discount.tr(), text: '0.0 ${LocaleKeys.lyd.tr()}'),
                              CustomTextRowCartWidget(
                                  title: LocaleKeys.shipping.tr(),
                                  text:
                                      '${checkOutCubit.deliveryFees} ${LocaleKeys.lyd.tr()}'),
                              CustomTextRowCartWidget(
                                  title: LocaleKeys.total.tr(),
                                  text:
                                      '${(cubit.totalPrice() + double.parse(checkOutCubit.deliveryFees)).toStringAsFixed(1)} ${LocaleKeys.lyd.tr()}'),
                            ],
                          );
                        },
                        listener: (context, state) {}),
                    verticalSpace(10),
                    Center(
                      child: CustomElevatedButton(
                          height: 45,
                          borderRadius: 50,
                          width: MediaQuery.of(context).size.width * 0.77,
                          fontSize: 17,
                          fontColor: AppColors.whiteColor,
                          onTap: () {
                            checkOutCubit.changeSteps(3);
                          },
                          buttonText: LocaleKeys.orderNow.tr()),
                    ),
                    verticalSpace(50),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
