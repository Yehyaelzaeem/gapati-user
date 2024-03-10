import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../order_details_screen.dart';

class CustomOrderItemWidget extends StatelessWidget {
  const CustomOrderItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderDetailsScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(color: Colors.black38,blurRadius: 3)]
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order No 143577',style: TextStyles.font18Black700Weight,),
                    const Text('+ 14/11/2022'),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(RestaurantImages.pro1,width: 50.w,height: 50.h,),
                        ),
                        horizontalSpace(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('CHEEERING BOX',style: TextStyles.font18Black700Weight.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp
                            ),),
                            Text('Kfc',style: TextStyles.font18Black700Weight.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                                color: AppColors.primaryColorLight
                            ),),

                          ],
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('\$ 120',style: TextStyles.font18Black700Weight.copyWith(
                        color: AppColors.primaryColorLight),),
                    Text('Delivered',style: TextStyles.font18Black700Weight.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 11.sp,
                        color: AppColors.customBlue),),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
