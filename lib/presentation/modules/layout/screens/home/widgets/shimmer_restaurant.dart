import 'package:cogina/core/global/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../component/images/custom_image.dart';
class RestaurantShimmerWidget extends StatelessWidget {
  const RestaurantShimmerWidget({Key? key, this.height}) : super(key: key);
  final double? height;
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width: double.infinity,
        height: height?? 150.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:6 ,
            itemBuilder: (context,index){
              return
                Padding(
                   padding: const EdgeInsets.all(8.0),
                   child:Column(
                     children: [
                       Container(
                           height:  90.w,
                           width: 90.w,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: AppColors.customGray.withOpacity(0.5)
                           ),
                           child: Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                               child: Shimmer.fromColors(
                                   enabled: true,
                                   baseColor:  Colors.grey[300]! ,
                                   highlightColor:  Colors.grey[100]!,
                                   child: const CustomImage(image: '',radius: 50))

                           )
                       ),
                        Shimmer.fromColors(
                          enabled: true,
                          baseColor:  Colors.grey[300]! ,
                          highlightColor:  Colors.grey[100]!,
                          child: Text('******',style: TextStyles.font20Black700Weight,))

                     ],
                   ),
                 );

            }),
      );
  }
}