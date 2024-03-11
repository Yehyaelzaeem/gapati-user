import 'package:cogina/core/assets_constant/images.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/component/custom_elevated_button.dart';
import 'package:cogina/presentation/modules/layout/screens/home/home_screen.dart';
import 'package:cogina/presentation/modules/map/map_order_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routing/navigation_services.dart';
import '../../../../../core/routing/routes.dart';
import '../../layout_screen.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(RestaurantImages.successImage),
            verticalSpace(100),
            Text('Order Successful!',
            style:TextStyles.font20Black700Weight.copyWith(
              fontSize: 25
            ),),
            Text('Your order will be delivered on time. \n Thank you ',
            style:TextStyles.font15CustomGray400Weight.copyWith(
              fontWeight: FontWeight.w600
            ),
            textAlign: TextAlign.center,),
            verticalSpace(40),
            CustomElevatedButton(
              borderRadius: 50,
              height: 45,
              width: MediaQuery.of(context).size.width*0.65,
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrderMapScreen()));
                  NavigationService.push(RoutesRestaurants.orderMapScreen);
                },
                buttonText: 'View Orders'),
            verticalSpace(20),
            CustomElevatedButton(
                borderRadius: 50,
                height: 45,
                width: MediaQuery.of(context).size.width*0.65,
                onTap: (){
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LayoutScreen(currentPage: 0,)));
                  NavigationService.pushReplacement(RoutesRestaurants.layout);
                },
                backgroundColor: AppColors.primaryColor.withOpacity(0.13),
                fontColor:AppColors.primaryColor ,
                buttonText: 'Continue Shopping')



          ],
        ),
      ),
    );
  }
}
