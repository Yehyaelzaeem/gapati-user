import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../core/routing/navigation_services.dart';
import '../../../../component/custom_rate.dart';
import '../../layout/screens/home/widgets/custom_logo_restuarant.dart';

class CustomRestaurantWidget extends StatelessWidget {
  const CustomRestaurantWidget({super.key});
  @override
  Widget build(BuildContext context) {
    double rating = 3;
    return
      InkWell(
        onTap: (){
          NavigationService.push(RoutesRestaurants.restaurantScreen);
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
                child:  CustomLogoRestaurant(height: 130.h,width: 130.h,),
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
                        Text('McDonald\'s',
                          style: TextStyles.font16Black600Weight,
                        ),
                        const Spacer(),
                        const Icon(Icons.favorite,color: Colors.red,),
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
