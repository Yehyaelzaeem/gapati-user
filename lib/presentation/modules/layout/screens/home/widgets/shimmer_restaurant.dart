import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'custom_logo_restuarant.dart';
class RestaurantShimmerWidget extends StatelessWidget {
  const RestaurantShimmerWidget({Key? key, this.height}) : super(key: key);
  final double? height;
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width: double.infinity,
        height: height?? 110.w,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:6 ,
            itemBuilder: (context,index){
              return Shimmer.fromColors(
                enabled: true,
                baseColor:  Colors.grey[300]! ,
                highlightColor:  Colors.grey[100]!,
                child:
                 const Padding(
                   padding: EdgeInsets.all(8.0),
                   child: CustomLogoRestaurant(image: '',),
                 )
              );
            }),
      );
  }
}