import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../data/model/response/home_model.dart';
import '../../../../../../data/model/response/restaurants_nearst_model.dart';
import 'custom_logo_restuarant.dart';

class CustomRestaurantItemWidget extends StatelessWidget {
  const CustomRestaurantItemWidget({super.key, required this.restaurant});
  final RestaurantsNearestModelData restaurant;
  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.only(right: 8.0,left: 8.0),
      child: SizedBox(
        width: 90.w,
        child: Column(
          children: [
            CustomLogoRestaurant(image: restaurant.image,),
            verticalSpace(5),
            FittedBox(child: Text(restaurant.name!,style: TextStyles.font16Black500Weight.copyWith(
              height: 1,
            ))),
          ],
        ),
      ),
    );
  }
}
