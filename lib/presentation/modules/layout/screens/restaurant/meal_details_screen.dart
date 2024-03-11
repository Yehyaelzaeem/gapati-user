import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/modules/layout/screens/restaurant/widgets/custom_sandwich_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/assets_constant/images.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';
import '../../../../../core/routing/navigation_services.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../component/custom_elevated_button.dart';
import '../cart/cart_screen.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffF1F2F6) ,
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:40.0),
              child: SizedBox(
                  height: 370.h,
                  child:
                  Image.asset(RestaurantImages.pro2,fit: BoxFit.cover,width: double.infinity,)
              ),
            ),
            Container(
                decoration:  BoxDecoration(
                    color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                      child: Column(
                        children: [
                          SizedBox(height: 5.h,),
                          Row(
                            children: [
                              Text('share box', style: TextStyles.font18Black700Weight.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: AppColors.customBlack
                              ),),
                              const Spacer(),
                              Text(
                                '\$20.00',
                                style: TextStyles.font16Black600Weight.copyWith(
                                    color:AppColors.redColor.withOpacity(0.6),
                                    fontSize: 18
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Container(
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200
                      ),
                      width: double.infinity,
                      child:
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: 10.w,vertical: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Description', style: TextStyles.font18Black700Weight.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.black
                            ),),
                            Text('McDonald’s Corporation (McDonald’s) is one of the world’s largest and most recognized fast-food chains, known for its hamburgers',
                              style: TextStyles.font18Black700Weight.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.customBlack
                            ),),
                            SizedBox(height: 15.h,),
                            Text('choose the first sandwich',
                                style: TextStyles.font18Black700Weight.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.black
                            ),),
                            SizedBox(height: 10.h,),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomSandwichWidget(),
                                CustomSandwichWidget(),
                                CustomSandwichWidget(),
                              ],
                            ),
                            SizedBox(height: 15.h,),
                            Text('choose the first sandwich',
                              style: TextStyles.font18Black700Weight.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black
                              ),),
                            SizedBox(height: 10.h,),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomSandwichWidget(),
                                CustomSandwichWidget(),
                                CustomSandwichWidget(),
                              ],
                            ),
                            SizedBox(height: 40.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: AppColors.backGroundPink2,
                                  radius: 30,
                                  child: Icon(Icons.remove,color: AppColors.backGroundPink3,weight: 5,size: 45,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: CustomElevatedButton(
                                      borderRadius: 50,
                                      height: 50,
                                      width: 200,
                                      borderColor: AppColors.primaryColor,
                                      fontColor: Colors.white,
                                      onTap: (){
                                        NavigationService.push(RoutesRestaurants.cartScreen,arguments: {'isLayout':false});

                                      }, buttonText: 'Add to Cart'),
                                ),
                                const CircleAvatar(
                                  backgroundColor: AppColors.sandwichBackGround,
                                  radius: 30,
                                  child: Icon(Icons.add,color: AppColors.primaryColor,weight: 5,size: 45,),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
