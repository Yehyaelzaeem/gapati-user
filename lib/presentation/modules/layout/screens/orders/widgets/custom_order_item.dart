import 'package:delivego/presentation/component/texts/black_texts.dart';

import '../../../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/routing/navigation_services.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/resources/color.dart';
import '../../../../../../data/model/response/order_model.dart';
import '../../../../../component/images/custom_image.dart';

class CustomOrderItemWidget extends StatelessWidget {
  const CustomOrderItemWidget({super.key, required this.orderModelData});
  final OrderModelData orderModelData;
  @override
  Widget build(BuildContext context) {
    bool hasImage = (orderModelData.orderDetails!=null && orderModelData.orderDetails!.isNotEmpty &&orderModelData.orderDetails![0].items!=null && orderModelData.orderDetails![0].items!.image !=null);
    return InkWell(
      onTap: (){
        NavigationService.push(RoutesRestaurants.orderDetailsScreen,arguments: {
          'orderId':orderModelData.id!,'orderModelData':orderModelData,
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
                    child: CustomImage(image: hasImage==true? orderModelData.orderDetails![0].items?.image??'' :'' ,radius: 10,
                      height: 95.h,
                    )),
                horizontalSpace(10),
                Expanded(
                  flex: 3,
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
                       Text('${orderModelData.paymentMethodLang??''}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child:  Container(
                  // width: 80.w,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment:  CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       FittedBox(
                         fit: BoxFit.scaleDown,
                         child:  Text(' ${(double.parse(orderModelData.price?.toString()??'0.0') +(double.parse(orderModelData.tripModel?.data?.price?.toString()??'0.0')))} ${LocaleKeys.lyd.tr()}',style: TextStyles.font18Black700Weight.copyWith(
                             color: AppColors.secondPrimaryColor),
                           maxLines: 1,
                           overflow: TextOverflow.ellipsis,),
                       ),
                        verticalSpace(30),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.customGray)
                          ),
                          child:
                          BlackMediumText(
                            label: '${orderModelData.statusLang}',
                            fontSize: 12.sp,
                            labelColor: AppColors.whiteColor,
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
