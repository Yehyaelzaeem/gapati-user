
import 'package:flutter/material.dart';
import '../../../../../../../core/routing/navigation_services.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../component/custom_elevated_button.dart';

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
            Image.asset(AppImages.successImage),
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
                  NavigationService.push(RoutesRestaurants.ordersScreen);
                  // NavigationService.push(RoutesRestaurants.orderMapScreen,arguments: {'orderId':orderId,'orderTotal':total});
                  },
                buttonText: 'View Orders'),
            verticalSpace(20),
            CustomElevatedButton(
                borderRadius: 50,
                height: 45,
                width: MediaQuery.of(context).size.width*0.65,
                onTap: (){
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
