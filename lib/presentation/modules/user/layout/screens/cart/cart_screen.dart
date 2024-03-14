import 'package:cogina/presentation/modules/user/layout/screens/cart/widgets/custom_cart_item.dart';
import 'package:cogina/presentation/modules/user/layout/screens/cart/widgets/custom_cart_top_widget.dart';
import 'package:cogina/presentation/modules/user/layout/screens/cart/widgets/custom_total_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../component/custom_app_bar.dart';
import '../../../../../component/custom_elevated_button.dart';

import '../../layout_cubit.dart';
List cartItemsList =[1,2,3,4,5];

class CartScreen extends StatelessWidget {
   final bool isLayOut;
   const CartScreen({super.key, required this.isLayOut});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
      CustomAppBar(
        title: 'Shopping cart',
        onBackPress: (){
                if(isLayOut==true){
                  final LayoutCubit viewModel = BlocProvider.of<LayoutCubit>(context);
                  viewModel.setCurrentIndex(0);
                }else{
                  Navigator.of(context).pop();
                }
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h,),
            const CustomCartTopWidget(title: 'In your cart', number: '5', iconData: Icons.shopping_cart_outlined, iconBackGround: AppColors.primaryColor),
            SizedBox(height: 10.h,),
            ...cartItemsList.map((e) => const CustomCartItem()),
            SizedBox(height: 10.h,),
            const CustomTotalWidget(),
            SizedBox(height: 20.h,),
            CustomElevatedButton(
                borderRadius: 50,
                height: 43,
                fontColor: AppColors.whiteColor,
                fontSize: 16,
                width: MediaQuery.of(context).size.width*0.9,
                onTap: (){
                  NavigationService.push(RoutesRestaurants.checkOut);
                }, buttonText: 'Checkout'),
            SizedBox(height: 60.h,),

          ],
        ),
      )
    );
  }
}
