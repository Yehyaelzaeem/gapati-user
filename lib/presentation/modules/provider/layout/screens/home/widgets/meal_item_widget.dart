import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/global/styles/colors.dart';
import '../../../../../../../core/global/styles/styles.dart';
import '../../../../../../../core/helpers/spacing.dart';

class MealItemWidget extends StatelessWidget {
  const MealItemWidget({super.key, required this.title, required this.des, required this.price, required this.image});
 final String title;
 final String des;
 final String price;
 final String image;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 130.h,
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 2)],
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*0.4,
            child: Image.asset(image),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
                style: TextStyles.font18Black700Weight.copyWith(
                    fontWeight: FontWeight.bold
                ),
              ),
              verticalSpace(5),
              Text(des,
                style: TextStyles.font15CustomGray400Weight.copyWith(
                    fontWeight: FontWeight.w600

                ),
              ),
              verticalSpace(5),
              Text(price,
                style: TextStyles.font18Black700Weight.copyWith(
                    color: AppColors.backBlue2,
                    fontWeight: FontWeight.bold

                ),
              ),
            ],
          ),
          const Spacer(),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:  EdgeInsets.only(bottom: 20.h),
                child: const Icon(Icons.delete,size: 25,color: AppColors.redColor,),
              )),
          horizontalSpace(20)
        ],
      ),
    );
  }
}
