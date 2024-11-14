import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/global/styles/colors.dart';
import '../../../../../../../core/global/styles/styles.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../data/model/response/category_item_model.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../../../component/rate_widget.dart';
import 'custom_offer_widget.dart';

class CustomNamePriceWidget extends StatelessWidget {
  const CustomNamePriceWidget({super.key, required this.name, this.priceDiscount, this.price, this.priceAfterDiscount, required this.categoriesItemsModelData});
 final String name;
 final CategoryItemsData categoriesItemsModelData;
 final dynamic priceDiscount;
 final dynamic price;
 final dynamic priceAfterDiscount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 0.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              horizontalSpace(16),
              Expanded(
                child: Text(
                  name??'',
                  style: TextStyles.font18Black700Weight.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: AppColors.customBlack),
                ),
              ),
              horizontalSpace(20),
            ],
          ),
         Row(
           children: [
             horizontalSpace(20),
             RateWidget(
               initialRating: 3,
               ignoreGestures: false,
               iconSize: 23,
               onRatingUpdate: (rate){
                 print('ssss $rate');
               },
             ),
           ],
         ),
          verticalSpace(10),
          Row(
            children: [
              horizontalSpace(16),
              priceDiscount != null &&priceDiscount !='0'?
              Text(
                '${double.parse(price?.toString()??'0').toStringAsFixed(1)} ${LocaleKeys.lyd.tr()}',
                style: TextStyles.font16Black600Weight.copyWith(fontSize: 14,
                    decorationColor: AppColors.customGray,
                    color: AppColors.customGray,
                    decorationThickness: 2,

                    decoration: TextDecoration.lineThrough),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ) : const SizedBox.shrink(),
              horizontalSpace(10),
              Text(
                '${double.parse(priceAfterDiscount.toString()).toStringAsFixed(1)} ${LocaleKeys.lyd.tr()}',
                style: TextStyles.font16Black600Weight.copyWith(
                    color: AppColors.black.withOpacity(0.6), fontSize: 18),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              categoriesItemsModelData.priceDiscount != null && categoriesItemsModelData!.priceDiscount !='0' ?
              CustomOfferWidget(priceDiscount: '${categoriesItemsModelData.priceDiscount?.toString()??'0'}',):
              const SizedBox.shrink()

            ],
          )
        ],
      ),
    );
  }
}
