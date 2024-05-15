import 'package:cogina/core/function/function.dart';
import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/translations/locale_keys.dart';
import 'package:cogina/domain/logger.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/cart_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/widgets/custom_cart_item.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/widgets/custom_cart_top_widget.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/widgets/custom_total_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../component/custom_app_bar.dart';
import '../../../../component/custom_elevated_button.dart';
import '../../layout_cubit.dart';
import '../home/home_cubit.dart';
import '../more/address/address_cubit.dart';
import 'check_out/check_out_cubit.dart';

class CartScreen extends StatelessWidget {
   final bool isLayOut;
   const CartScreen({super.key, required this.isLayOut});
  @override
  Widget build(BuildContext context) {
    CartCubit cubit =CartCubit.get(context);
    // cubit.getCart(context);
    return
      Scaffold(
      appBar:
      CustomAppBar(
        title: LocaleKeys.shoppingCart.tr(),
        onBackPress: (){
                if(isLayOut==true){
                  final LayoutCubit viewModel = BlocProvider.of<LayoutCubit>(context);
                  viewModel.setCurrentIndex(0);
                }else{
                  Navigator.of(context).pop();
                }
        },
      ),
      body: BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {},
              builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 10.h,),
                         CustomCartTopWidget(title:
                             cubit.storeName!=null?
                             cubit.storeName!:'',
                             number: cubit.products.isNotEmpty?
                             cubit.products.length.toString():'0',
                             iconData: Icons.shopping_cart_outlined,
                             iconBackGround: AppColors.primaryColor),
                        SizedBox(height: 10.h,),
                            if(cubit.products.isNotEmpty)
                               ...cubit.products.map((e) =>  CustomCartItem(product: e,hasShadow: true, storeId:e.storeId!.toString(),))
                            else
                             const SizedBox.shrink(),

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
                              if(cubit.products.isNotEmpty){
                                CheckOutCubit.get(context).changeSteps(0);
                                AddressCubit.get(context).getAllAddress();
                                NavigationService.push(RoutesRestaurants.checkOut);
                              }
                              else{
                                context.pushNamedAndRemoveUntil(RoutesRestaurants.restaurantsScreen,predicate: (Route<dynamic> route) =>route.isFirst);
                              }
                            }, buttonText:cubit.products.isNotEmpty? LocaleKeys.checkout.tr():LocaleKeys.goToShopping.tr()),
                        SizedBox(height: 60.h,),
                      ],
                    ),
                  );
              },
            )
    );

  }
}
