import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../component/custom_rate.dart';

class CustomMealWidget extends StatelessWidget {
  const CustomMealWidget({super.key});
  @override
  Widget build(BuildContext context) {
    double rating = 3;
    return
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 130.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffDFDADA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(RestaurantImages.bur1),
                ),
              ),
            ),
            FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 10.h,),
                  Text('share box',
                    style: TextStyles.font16Black600Weight,
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
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize: const Size(20, 30), // Set your desired width and height
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.shopping_cart_checkout_sharp, color: Colors.white, size: 12),
                            Text(
                              '  Add to Cart',
                              style: TextStyles.font14White500Weight.copyWith(fontSize: 12),
                            )
                          ],
                        ),
                      )),
                  SizedBox(height: 10.h,),
                ],
              ),
            ),
            SizedBox(width: 5.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10.h,),
                const Icon(Icons.favorite,color: Colors.red,),
                SizedBox(height: 10.h,),
                Text(
                  '\$20.00',
                  style: TextStyles.font16Black600Weight.copyWith(
                      color:AppColors.redColor
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10.h,),
              ],
            ),
            SizedBox(width: 5.w,),
          ],
        ),
      ),
    );
  }
}
