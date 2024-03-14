import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import '../../../../../../../core/routing/navigation_services.dart';
import '../../../../../../../core/routing/routes.dart';
import 'custom_restaurant_item_widget.dart';

List restaurantsList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

class CustomRestaurantsListWidget extends StatelessWidget {
  const CustomRestaurantsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...restaurantsList.map((e) => InkWell(
                onTap: (){
                  NavigationService.push(RoutesRestaurants.restaurantScreen);
                },
                child: const CustomRestaurantItemWidget())),
            InkWell(
              onTap: (){
                NavigationService.push(RoutesRestaurants.restaurantsScreen);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: SizedBox(
                  width: 60.w,
                  child: Column(
                    children: [
                      Container(
                          height: 90.w,
                          width: 60.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.customBluColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                               Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.bagColor,
                                    child: Icon(Icons.read_more_rounded,color: Colors.grey.shade700,),
                                  )),
                              Text('See More',
                                  style: TextStyles.font14White500Weight.copyWith(
                                      fontSize: 12,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.bold
                                  ))
                            ],
                          )),


                    ],
                  ),
                ),
              ),
            )
          ],
        )
        // ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: 10,
        //     itemBuilder: (context,index){
        //       return InkWell(
        //           onTap: (){
        //             // Navigator.push(context, MaterialPageRoute(builder: (context)=>const RestaurantScreen()));
        //             NavigationService.push(RoutesRestaurants.restaurantScreen);
        //
        //           },
        //           child: const CustomRestaurantItemWidget());
        //     }),
        );
  }
}
