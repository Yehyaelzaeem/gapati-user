import 'package:cogina/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../data/model/response/home_model.dart';
import 'custom_logo_restuarant.dart';

class CustomRestaurantItemWidget extends StatelessWidget {
  const CustomRestaurantItemWidget({super.key, required this.dataHome});
  final DataHome dataHome;
  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.only(right: 8.0,left: 8.0),
      child: SizedBox(
        width: 90.w,
        child: Column(
          children: [
            CustomLogoRestaurant(image: dataHome.image,),
            verticalSpace(5),
            FittedBox(child: Text(dataHome.name!,style: TextStyles.font16Black500Weight.copyWith(
              height: 1,
            ))),
          ],
        ),
      ),
    );
  }
}
