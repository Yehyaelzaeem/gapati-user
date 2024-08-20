
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../core/routing/navigation_services.dart';
import '../../../../core/function/function.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../data/model/response/home_model.dart';
import '../../../component/custom_rate.dart';
import '../../layout/screens/favorite/favorite_cubit.dart';
import '../../layout/screens/home/widgets/custom_logo_restuarant.dart';

class CustomRestaurantWidget extends StatelessWidget {
  const CustomRestaurantWidget({super.key, required this.restaurantData});
  final DataHome restaurantData;
  @override
  Widget build(BuildContext context) {
   print('test ${restaurantData.toJson()}');
    return
      InkWell(
        onTap: (){
          NavigationService.push(RoutesRestaurants.restaurantScreen,arguments:
          {'id':restaurantData.id,'storeName':restaurantData.name,'image':restaurantData.banner,'isFav':restaurantData.inFav});
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
                child:  CustomLogoRestaurant(image: restaurantData.image,height: 130.h,width: 130.h,),
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
                        Text(restaurantData.name??'',
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
                                                if(restaurantData.inFav==false){
                                                  cubit.addFavoriteRestaurant(restaurantId: restaurantData.id!, context: context,);
                                                  restaurantData.inFav=true;
                                                }else{
                                                  cubit.removeFavoriteRestaurant(restaurantId: restaurantData.id!, context: context);
                                                  restaurantData.inFav=false;
                                                }
                                              });
                                            }, context: context, screenName: 'favoriteDetails');
                                   },
                                child:restaurantData.inFav==true?
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
                            rating: restaurantData.rate!.toDouble(),
                            onChanged: (rating) {

                            },
                          ),
                          SizedBox(width: 10.w,),
                          Text(
                            restaurantData.rate!.toDouble().toString(),
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
