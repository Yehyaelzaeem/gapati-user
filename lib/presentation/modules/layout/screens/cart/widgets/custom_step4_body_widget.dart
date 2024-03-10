import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../component/custom_elevated_button.dart';
import '../order_success_screen.dart';
import 'custom_cart_item.dart';
import 'custom_cart_top_widget.dart';
import 'custom_text_row_cart.dart';
class CustomStepBody4Widget extends StatelessWidget {
   CustomStepBody4Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(30),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
            ),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomCartTopWidget(title: 'In your cart', number: '5', iconData: Icons.shopping_cart_outlined, iconBackGround: AppColors.primaryColor,size: 25,),
                verticalSpace(10),
                ...cartList.map((e) => const CustomCartItem(height:100,hasShadow: true,),),
                const CustomCartTopWidget(title: 'Delivery', number: '+ \$250.5', iconData: Icons.delivery_dining_outlined, iconBackGround: AppColors.buttonOrangeColor,size: 25,),
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: 25.w),
                  child: Text('Hr#300.ASan Ramon ,Ca ,California',
                    style: TextStyles.font15CustomGray400Weight,),
                ),
                verticalSpace(10),
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.backGroundGray
                      ),
                      child: const CustomTextRowCartWidget(horizontal:20,vertical:13,title: 'Standard', text: '\$290.05')),
                ),
                verticalSpace(30),
                const CustomTextRowCartWidget(title: 'subtotal', text: '\$290.05'),
                const CustomTextRowCartWidget(title: 'discount', text: '\$30.05'),
                const CustomTextRowCartWidget(title: 'shipping', text: '\$5.05'),
                const CustomTextRowCartWidget(title: 'Total', text: '\$290.05'),
                verticalSpace(10),
                Center(
                  child: CustomElevatedButton(
                      height: 45,
                      borderRadius: 50,
                      width: MediaQuery.of(context).size.width*0.77,
                      fontSize: 17,
                      fontColor: AppColors.whiteColor,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrderSuccessScreen()));
                        // NavigationService.push(RoutesRestaurants.restaurantsHome);

                      }, buttonText: 'Order now'),
                ),
                verticalSpace(50),
              ],
            ),
          )
        ],
      ),
    );
  }
  List cartList=[1,2,3,4,5];

}