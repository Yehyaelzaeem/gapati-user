import 'package:cogina/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../component/custom_elevated_button.dart';
import '../../../../../component/custom_rate.dart';
import '../../restaurant/restautant_screen.dart';

class CustomProductItemWidget extends StatelessWidget {
  const CustomProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double rating = 3;

    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const RestaurantScreen()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: AppColors.whiteColor,
                  blurRadius: 1,
                  spreadRadius: 1)
            ]),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 167.w,
                height: 131.h,
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(RestaurantImages.bur1)
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(8),
                Text(
                  'Mix 2 Meal',
                  style: TextStyles.font16Black600Weight,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Center(
                  child: StatefulBuilder(builder: (context,setState){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingWidget(
                          filledStar: Icons.star,
                          halfStar: Icons.star_half,
                          emptyStar: Icons.star_border,
                          rating: rating,
                          onChanged: (rating) {
                            setState(() {
                              rating = rating;
                            });
                          },
                        ),
                        SizedBox(width: 10.w,),
                        Text(
                          '$rating',
                          style: TextStyles.font16Black600Weight.copyWith(
                            fontSize: 13
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    );
                    },),
                ),
                Text(
                  '\$20.00',
                  style: TextStyles.font16Black600Weight.copyWith(
                    color:AppColors.textPink
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomElevatedButton(
                      borderRadius: 50,
                      height: 30,
                      fontColor: Colors.white,
                      backgroundColor: AppColors.buttonOrangeColor,
                      onTap: (){

                  }, buttonText: 'Add to Cart'),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
