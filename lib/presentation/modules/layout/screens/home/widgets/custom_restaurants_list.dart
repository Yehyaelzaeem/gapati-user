import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/translations/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import '../../../../../../../core/routing/navigation_services.dart';
import '../../../../../../../core/routing/routes.dart';
import '../home_cubit.dart';
import 'custom_restaurant_item_widget.dart';


class CustomRestaurantsListWidget extends StatelessWidget {
  const CustomRestaurantsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit =HomeCubit.get(context);

    return BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SizedBox(
                  height: 140.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...cubit.listData!.map((e) => InkWell(
                          onTap: (){

                            NavigationService.push(RoutesRestaurants.restaurantScreen,arguments: {'id':e.id,'storeName':e.name,'image':e.banner!,'isFav':e.inFav});
                          },
                          child:  CustomRestaurantItemWidget(dataHome: e,))),
                      cubit.listData!.length>3?
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
                                    child:
                                    Padding(
                                       padding: const EdgeInsets.symmetric(
                                           horizontal: 8, vertical: 8),
                                       child: CircleAvatar(
                                         backgroundColor: AppColors.whiteColor,
                                         child: Icon(Icons.read_more_rounded,color: Colors.grey.shade700,),
                                       ))),
                                verticalSpace(5),
                                Expanded(
                                  child: Text(LocaleKeys.seeMore.tr(),
                                      style: TextStyles.font14White500Weight.copyWith(
                                          fontSize: 12,
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.bold
                                      )),
                                )

                              ],
                            ),
                          ),
                        ),
                      ):SizedBox.shrink()
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
            },
          );
  }
}
