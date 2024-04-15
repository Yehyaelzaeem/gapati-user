import 'package:cogina/core/translations/locale_keys.dart';
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
import '../more/address/address_cubit.dart';
import 'check_out/check_out_cubit.dart';

class CartScreen extends StatelessWidget {
   final bool isLayOut;
   const CartScreen({super.key, required this.isLayOut});
  @override
  Widget build(BuildContext context) {
    CartCubit cubit =CartCubit.get(context);
    cubit.getCart(context);
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
                         cubit.storeDate!=null?
                         cubit.storeDate!.name!:'',
                             number: cubit.items!=null?
                             cubit.items!.length.toString():'0',
                             iconData: Icons.shopping_cart_outlined,
                             iconBackGround: AppColors.primaryColor),
                        SizedBox(height: 10.h,),
                        if(cubit.items!=null)
                            if(cubit.items!.isNotEmpty)
                               ...cubit.items!.map((e) =>  CustomCartItem(item: e,hasShadow: true,))
                            else
                             const SizedBox.shrink()
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
                              CheckOutCubit.get(context).changeSteps(0);
                              AddressCubit.get(context).getMainAddress();
                              NavigationService.push(RoutesRestaurants.checkOut);
                            }, buttonText: LocaleKeys.checkout.tr()),
                        SizedBox(height: 60.h,),

                      ],
                    ),
                  );
              },
            )
    );

  }
}
