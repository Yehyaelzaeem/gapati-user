import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/modules/layout/screens/restaurant/widgets/custom_best_meals_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/assets_constant/images.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';
import '../../../../component/custom_text_field.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor:AppColors.backGroundPink ,
        body:
        Stack(
          fit: StackFit.expand,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                    height: 280.h,
                    child:
                    Image.asset(RestaurantImages.mc1,fit: BoxFit.cover,)
                ),
              ],
            ),
            Positioned(
                top: 60.h,
                left: 10.w,
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
                      child: Icon(Icons.arrow_back_ios_new_rounded,size: 18,color: AppColors.customGray.withOpacity(0.4),),
                    ),
                  ),
                )),
            Positioned(
                top: 120.h,
                left: 50.w,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: CustomTextField(
                        hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                        fillColor: AppColors.whiteColor.withOpacity(0.6),
                        borderColor: AppColors.whiteColor.withOpacity(0.0),
                        borderRadius: 30,
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search',
                        hintColor: AppColors.black,
                        controller: TextEditingController(),),
                    ),
                    horizontalSpace(10),
                    const Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 30,)
                  ],
                ),
                ),

            Positioned.fill(
              top: 236.h,
              child: Container(
                  decoration:  BoxDecoration(
                      color: AppColors.customWhite,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 100,
                  child:StatefulBuilder(builder: (context,setState){
                    return  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TabBar(
                          labelStyle: TextStyles.font18Black700Weight,
                          indicatorColor: AppColors.primaryColor,
                          labelColor:  AppColors.primaryColor,
                          tabs:  const [
                            Tab(text: 'Best Meals'),
                            Tab(text: 'Offer Meals'),
                            Tab(text: 'Breakfast'),
                          ],
                        ),
                        const Expanded(
                          child: TabBarView(
                            children: [
                               CustomBestMealsWidget(),
                               CustomBestMealsWidget(),
                               CustomBestMealsWidget(),
                            ],
                          ),
                        ),
                      ],
                    );
                  },)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
