import 'package:cogina/presentation/component/images/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/routing/navigation_services.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../../../core/translations/locale_keys.dart';
import '../../../../../../data/model/response/order_details_model.dart';


class CustomOrderDetailsItemWidget extends StatelessWidget {
  const CustomOrderDetailsItemWidget({super.key, required this.orderDetailsModelData});
  final OrderDetailsModelData orderDetailsModelData;
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
                    child: CustomImage(image: orderDetailsModelData.items!.image!,radius: 5,)),
                horizontalSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(5),
                      Text('${orderDetailsModelData.items!.name}',style: TextStyles.font18Black700Weight.copyWith(
                          height: 1
                      ),),
                      Text('${orderDetailsModelData.items!.description}',style: TextStyles.font18Black700Weight.copyWith(
                          fontWeight: FontWeight.w500,
                          height: 1,
                          fontSize: 12.sp
                      ),),
                      verticalSpace(4),
                      Text('${orderDetailsModelData.qty}',style: TextStyles.font18Black700Weight.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: AppColors.secondPrimaryColor
                      ),),
                      Text('${orderDetailsModelData.items!.price} ${LocaleKeys.lyd.tr()}',style: TextStyles.font18Black700Weight.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp
                      ),),

                    ],
                  ),
                ),
                horizontalSpace(8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${orderDetailsModelData.subTotal} ${LocaleKeys.lyd.tr()}',style: TextStyles.font18Black700Weight.copyWith(
                        color: AppColors.secondPrimaryColor),),
                    Text('${orderDetailsModelData.items!.categoryName}',style: TextStyles.font18Black700Weight.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 11.sp,
                        color: AppColors.customBlue),),
                  ],
                ),
                horizontalSpace(10)
              ],
            ),
            orderDetailsModelData.items!.priceDiscount!=null&&orderDetailsModelData.items!.priceDiscount!='0'?
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
                    child: Text('${orderDetailsModelData.items!.priceDiscount!}%',
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
