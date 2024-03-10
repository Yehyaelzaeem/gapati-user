import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../restaurant/restautant_screen.dart';
import 'custom_restaurant_item_widget.dart';
class CustomRestaurantsListWidget extends StatelessWidget {
  const CustomRestaurantsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context,index){
            return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const RestaurantScreen()));
                },
                child: const CustomRestaurantItemWidget());
          }),
    );
  }
}
