import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/routing/navigation_services.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../data/model/response/order_details_model.dart';
import '../../../../../component/images/custom_image.dart';
import '../../../../restaurant/widgets/custom_chip.dart';


class CustomOrderDetailsItemWidget extends StatelessWidget {
  const CustomOrderDetailsItemWidget({super.key, required this.orderDetailsModelData});
  final OrderDetails orderDetailsModelData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(color: Colors.black38,blurRadius: 3)]
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width:120.w,
                    height: 100.h,
                    child: CustomImage(image:orderDetailsModelData.items?.image??'',radius: 5,)),
                horizontalSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(5),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${orderDetailsModelData.items?.name??''}',style: TextStyles.font18Black700Weight.copyWith(
                                    height: 1.5
                                ),),
                                Text('${orderDetailsModelData.items?.description??''}',style: TextStyles.font18Black700Weight.copyWith(
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                    fontSize: 12.sp,
                                ),
                                maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          horizontalSpace(10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('${orderDetailsModelData.subTotal} ${LocaleKeys.lyd.tr()}',style: TextStyles.font18Black700Weight.copyWith(
                                  color: AppColors.secondPrimaryColor),),
                              Text('${orderDetailsModelData.items?.categoryName??''}',style: TextStyles.font18Black700Weight.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11.sp,
                                  color: AppColors.customBlue),),
                            ],
                          ),
                          horizontalSpace(10)
                        ],
                      ),
                     Row(
                       children: [
                         Column(
                           children: [
                             verticalSpace(4),
                             Row(
                               children: [
                                 Text('${LocaleKeys.qty.tr()} : ',style: TextStyles.font18Black700Weight.copyWith(
                                     fontWeight: FontWeight.w600,
                                     fontSize: 12.sp,
                                     color: Colors.black38
                                 ),),
                                 Text(' ${orderDetailsModelData.qty}',style: TextStyles.font18Black700Weight.copyWith(
                                     fontWeight: FontWeight.w600,
                                     fontSize: 12.sp,
                                     color: AppColors.secondPrimaryColor.withOpacity(0.8)
                                 ),),
                               ],
                             ),
                             if(orderDetailsModelData.size!=null)
                             Row(
                               children: [
                                 Text('${LocaleKeys.size.tr()} : ',style: TextStyles.font18Black700Weight.copyWith(
                                     fontWeight: FontWeight.w600,
                                     fontSize: 12.sp,
                                     color: Colors.black38
                                 ),),
                                 Text('${orderDetailsModelData.size?.name??''}',style: TextStyles.font18Black700Weight.copyWith(
                                     fontWeight: FontWeight.w600,
                                     fontSize: 12.sp,
                                     color: AppColors.secondPrimaryColor.withOpacity(0.8)
                                 ),),
                               ],
                             )
                             // Text('${orderDetailsModelData.items?.price??''} ${LocaleKeys.lyd.tr()}',style: TextStyles.font18Black700Weight.copyWith(
                             //     fontWeight: FontWeight.w500,
                             //     fontSize: 12.sp
                             // ),),
                           ],
                         ),
                         horizontalSpace(8),
                         orderDetailsModelData.extra!=null?
                         Expanded(
                           child: Container(
                             height: 30,
                             child: SingleChildScrollView(
                               scrollDirection: Axis.horizontal,
                               child: Row(
                                 children: [
                                   Wrap(
                                       spacing: 5,
                                       children: [
                                         ...orderDetailsModelData.extra!.data!.map((e) =>
                                             Container(
                                               height: 30.h,
                                               child: FittedBox(
                                                 child: OutlinedChip(
                                                   backgroundColor: AppColors.sandwichBackGround,
                                                   avatarBackgroundColor: AppColors.primaryColor,
                                                   label: e.name!,
                                                   price: '${e.price}',
                                                 ),
                                               ),
                                             ),)
                                       ]),
                                 ],
                               ),
                             ),
                           ),
                         ):SizedBox.shrink(),
                       ],
                     )
                    ],
                  ),
                ),
              ],
            ),
            orderDetailsModelData.items?.priceDiscount!=null&&orderDetailsModelData.items!.priceDiscount!='0'?
            Positioned(
                left: context.locale.languageCode==Locale('en').toString()?0:null,
                bottom: 0,
                right: context.locale.languageCode==Locale('ar').toString()?0:null,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.redColor.withOpacity(0.5),
                      borderRadius:
                      BorderRadius.only(
                        topLeft: Radius.circular(context.locale.languageCode==Locale('en').toString()?0:10),
                        bottomRight: Radius.circular(context.locale.languageCode==Locale('en').toString()?0:10),
                          topRight: Radius.circular(context.locale.languageCode==Locale('en').toString()?10:0),
                          bottomLeft: Radius.circular(context.locale.languageCode==Locale('en').toString()?10:0),
                      )
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 6.w,vertical: 1.w),
                    child: Text('${orderDetailsModelData.items?.priceDiscount??''}%',
                    style: TextStyles.font14White500Weight,
                    ),
                  ),
                )):SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
