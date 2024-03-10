import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';

class CustomRestaurantItemWidget extends StatelessWidget {
  const CustomRestaurantItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0,left: 8.0),
      child: SizedBox(
        width: 90.w,
        child: Column(
          children: [
            Container(
              height: 90.w,
              width: 90.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.customBluColor,
              ),
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                child: CircleAvatar(
                  backgroundColor: const Color(0xffD52B1E),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.asset(RestaurantImages.mc,
                      fit: BoxFit.cover,),
                  ),
                )

              )
            ),
            Expanded(child: Text('macdonalds',style: TextStyles.font16Black500Weight)),
          ],
        ),
      ),
    );
  }
}
