import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../../../generated/locale_keys.g.dart';

class CustomNamePriceWidget extends StatelessWidget {
  const CustomNamePriceWidget({super.key, required this.name, this.priceDiscount, this.price, this.priceAfterDiscount});
 final String name;
 final dynamic priceDiscount;
 final dynamic price;
 final dynamic priceAfterDiscount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: TextStyles.font18Black700Weight.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: AppColors.customBlack),
                ),
              ),
              horizontalSpace(20),
              Row(
                children: [
                  priceDiscount !=
                      null &&priceDiscount !='0'? Text(
                    '${double.parse(price.toString()).toStringAsFixed(1)} ${LocaleKeys.lyd.tr()}',
                    style: TextStyles.font16Black600Weight.copyWith(fontSize: 14,
                        decorationColor: AppColors.blackColor,
                        decorationThickness: 25,
                        decoration: TextDecoration.lineThrough),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ) : const SizedBox.shrink(),
                  horizontalSpace(10),
                  Text(
                    '${double.parse(priceAfterDiscount.toString()).toStringAsFixed(1)} ${LocaleKeys.lyd.tr()}',
                    style: TextStyles.font16Black600Weight.copyWith(
                        color: AppColors.redColor.withOpacity(0.6), fontSize: 18),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
