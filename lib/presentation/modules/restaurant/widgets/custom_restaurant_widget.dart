
import 'package:delivego/core/helpers/toast_states/enums.dart';
import 'package:delivego/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../core/routing/navigation_services.dart';
import '../../../../core/function/function.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../data/model/response/home_model.dart';
import '../../../../data/model/response/restaurants_nearst_model.dart';
import '../../../component/custom_rate.dart';
import '../../layout/screens/favorite/favorite_cubit.dart';
import '../../layout/screens/home/widgets/custom_logo_restuarant.dart';

class CustomRestaurantWidget extends StatelessWidget {
  const CustomRestaurantWidget({super.key, required this.restaurant});
  final RestaurantsNearestModelData restaurant;
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: (){
          if(restaurant.branch!=null && restaurant.branch!.id !=0){
            NavigationService.push(RoutesRestaurants.restaurantScreen,arguments:
            {'id':restaurant.id,'storeName':restaurant.name,'image':restaurant.banner,'isFav':restaurant.inFav,
              'branchId':restaurant.branch?.id??0,'categoryId':restaurant.category?.id??0
            });
          }else{
            showToast(text: '${LocaleKeys.theRestaurantNotInRange.tr()}', state: ToastStates.error, context: context);
          }


        },
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 130.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.black38,blurRadius: 3)]
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffDFDADA),
                  borderRadius: BorderRadius.circular(20),
                ),
                child:  CustomLogoRestaurant(image: restaurant.image,height: 130.h,width: 130.h,),
              ),
              horizontalSpace(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    verticalSpace(10),
                    Row(
                      children: [
                        Text(restaurant.name??'',
                          style: TextStyles.font16Black600Weight,
                        ),
                        const Spacer(),
                        StatefulBuilder(builder: (context,setState){
                          return
                            InkWell(
                                onTap: (){
                                  FavoriteCubit cubit=FavoriteCubit.get(context);
                                   logInFirst(function: (){
                                              setState(() {
                                                if(restaurant.inFav==false){
                                                  cubit.addFavoriteRestaurant(restaurantId: restaurant.id!, context: context,);
                                                  restaurant.inFav=true;
                                                }else{
                                                  cubit.removeFavoriteRestaurant(restaurantId: restaurant.id!, context: context);
                                                  restaurant.inFav=false;
                                                }
                                              });
                                            }, context: context, screenName: 'favoriteDetails');
                                   },
                                child:restaurant.inFav==true?
                                Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_rounded,color: Colors.grey,));
                        }),
                        horizontalSpace(15)
                      ],
                    ),
                    verticalSpace(2),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Text('McDonald\'s is a global fast-food restaurant chain, renowned for its iconic golden arches logo. Founded in 1940 by Richard and Maurice McDonald, it has grown into one of the world\'s largest and most recognizable fast-food brands. McDonald\'s offers a diverse menu, including burgers, ',
                          style: TextStyles.font10CustomGray400Weight,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    verticalSpace(2),
                    StatefulBuilder(builder: (context,setState){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RatingWidget(
                            filledStar: Icons.star,
                            halfStar: Icons.star_half,
                            emptyStar: Icons.star_border,
                            rating: restaurant.rate!.toDouble(),
                            onChanged: (rating) {

                            },
                          ),
                          SizedBox(width: 10.w,),
                          Text(
                            restaurant.rate!.toDouble().toString(),
                            style: TextStyles.font16Black600Weight.copyWith(
                                fontSize: 13
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      );
                    },),
                    SizedBox(height: 10.h,),
                  ],
                ),
              ),
              const SizedBox()
            ],
          ),
        ),
            ),
      );
  }
}
