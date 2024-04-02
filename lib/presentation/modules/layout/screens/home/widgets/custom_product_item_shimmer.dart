import 'package:cogina/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../../core/assets_constant/images.dart';
import '../../../../../../../core/routing/navigation_services.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../../component/custom_elevated_button.dart';
import '../../../../../component/custom_rate.dart';


class CustomProductItemShimmer extends StatelessWidget {
  const CustomProductItemShimmer({super.key, this.inHome});
  final bool? inHome;
  @override
  Widget build(BuildContext context) {
    double rating = 3;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow:  <BoxShadow>[
              BoxShadow(
                   color: inHome==false?Colors.black26: AppColors.whiteColor,
                  blurRadius: 1,
                  spreadRadius: 1)
            ]),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Shimmer.fromColors(
                enabled: true,
                baseColor:  Colors.grey[300]! ,
                highlightColor:  Colors.grey[100]!,
                child:
                 FittedBox(
                   child: Container(
                      width: 215.w,
                      height: 131.h,
                      decoration: BoxDecoration(
                        color: AppColors.greyColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(RestaurantImages.pro1,)
                                   ),
                 )
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(8),
                  Shimmer.fromColors(
                      enabled: true,
                      baseColor:  Colors.grey[300]! ,
                      highlightColor:  Colors.grey[100]!,
                      child:
                      Text(
                        '******',
                        style: TextStyles.font20Black700Weight,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ),
                  // Center(
                  //   child: StatefulBuilder(builder: (context,setState){
                  //     return Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         RatingWidget(
                  //           filledStar: Icons.star,
                  //           halfStar: Icons.star_half,
                  //           emptyStar: Icons.star_border,
                  //           rating: rating,
                  //           onChanged: (rating) {
                  //             setState(() {
                  //               rating = rating;
                  //             });
                  //           },
                  //         ),
                  //         SizedBox(width: 10.w,),
                  //         Text(
                  //           '$rating',
                  //           style: TextStyles.font16Black600Weight.copyWith(
                  //             fontSize: 13
                  //           ),
                  //           maxLines: 1,
                  //           overflow: TextOverflow.ellipsis,
                  //         ),
                  //       ],
                  //     );
                  //     },),
                  // ),
                  Row(
                    children: [
                      Shimmer.fromColors(
                        enabled: true,
                        baseColor:  Colors.grey[300]! ,
                        highlightColor:  Colors.grey[100]!,
                        child:
                        Text(
                          '\$0.00',
                          style: TextStyles.font16Black600Weight.copyWith(
                              color:AppColors.textPink
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      horizontalSpace(10),
                      Shimmer.fromColors(
                        enabled: true,
                        baseColor:  Colors.grey[300]! ,
                        highlightColor:  Colors.grey[100]!,
                        child:
                        Text(
                          '\$0.00',
                          style: TextStyles.font16Black600Weight.copyWith(
                              color:AppColors.textPink
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Shimmer.fromColors(
                    enabled: true,
                    baseColor:  Colors.grey[300]! ,
                    highlightColor:  Colors.grey[100]!,
                    child:
                    Text(
                      'From ****-**-** To ****-**-**',
                      style: TextStyles.font16Black600Weight.copyWith(
                          color:AppColors.textPink
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Shimmer.fromColors(
                    enabled: true,
                    baseColor:  Colors.grey[300]! ,
                    highlightColor:  Colors.grey[100]!,
                    child:
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomElevatedButton(
                            borderRadius: 50,
                            height: 30,
                            fontColor: Colors.white,
                            backgroundColor: AppColors.buttonOrangeColor,
                            onTap: (){

                            }, buttonText: 'Add to Cart'),
                      ),
                    ),
                  ),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
