import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../component/custom_elevated_button.dart';
import '../widgets/custom_sandwich_widget.dart';

class MealDetailsScreen extends StatelessWidget {
   MealDetailsScreen({super.key});
  bool isFav=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffF1F2F6) ,
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:50.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                      height:MediaQuery.of(context).size.height*0.25,
                      child:
                      Image.asset(RestaurantImages.pro2,)
                  ),
                ),
                Positioned(
                    top: 60.h,
                    left: 20.w,
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.whiteColor,
                            boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 7,
                                offset: Offset(1, 5)
                            )]
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Icon(Icons.arrow_back_ios_new_rounded,size: 20,color: AppColors.customGray.withOpacity(0.4),),
                        ),
                      ),
                    )),
                Positioned(
                    top: 60.h,
                    right: 20.w,
                    child:StatefulBuilder(builder: (context,setState){
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.whiteColor.withOpacity(0.7),
                            boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 7,
                                offset: Offset(1, 5)
                            )]
                        ),
                        child:  InkWell(
                          onTap: (){
                            setState((){
                              isFav=!isFav;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child:
                            isFav==true?
                            const Icon(Icons.favorite,size: 25,color: AppColors.redColor,):
                            const Icon(Icons.favorite_border_rounded,size: 25,color: AppColors.customGray,),
                          ),
                        ),
                      );
                    },)
                    ),
              ],
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
