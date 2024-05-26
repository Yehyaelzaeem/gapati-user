import '../../../../../../../generated/locale_keys.g.dart';
import 'package:cogina/presentation/component/images/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/routing/navigation_services.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../../../data/model/response/order_model.dart';

class CustomOrderItemWidget extends StatelessWidget {
  const CustomOrderItemWidget({super.key, required this.orderModelData});
  final OrderModelData orderModelData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigationService.push(RoutesRestaurants.orderDetailsScreen,arguments: {
          'orderId':orderModelData.id!,'total':orderModelData.price,
          'phone':orderModelData.phone!=null?orderModelData.phone!:'','address':orderModelData.toAddress,
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(color: Colors.black38,blurRadius: 1)]
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 95.w,
                    child: CustomImage(image: orderModelData.image!,radius: 10,)),
                horizontalSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${LocaleKeys.orderNo.tr()} ${orderModelData.id}',style: TextStyles.font14White500Weight.copyWith(
                             color: AppColors.primaryColor
                           ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,),
                      Text('${orderModelData.name}',style: TextStyles.font18Black700Weight, maxLines: 1,
                        overflow: TextOverflow.ellipsis,),
                       Text('${orderModelData.date}' ,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,),
                       Text('${orderModelData.paymentMethod}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
                Container(
                  width: 70.w,
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(' ${orderModelData.price} ${LocaleKeys.lyd.tr()}',style: TextStyles.font18Black700Weight.copyWith(
                            color: AppColors.secondPrimaryColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,),
                        Text('${LocaleKeys.delivered.tr()}',style: TextStyles.font18Black700Weight.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 11.sp,
                            color: AppColors.primaryColor),),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
