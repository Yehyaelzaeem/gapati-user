
import 'package:delivego/core/helpers/extensions.dart';
import 'package:delivego/core/helpers/spacing.dart';
import 'package:delivego/presentation/modules/layout/screens/cart/widgets/custom_cart_item.dart';
import 'package:delivego/presentation/modules/layout/screens/cart/widgets/custom_cart_top_widget.dart';
import 'package:delivego/presentation/modules/layout/screens/cart/widgets/custom_total_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../core/helpers/toast_states/enums.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../component/custom_app_bar.dart';
import '../../../../component/custom_elevated_button.dart';
import '../../../../component/texts/black_texts.dart';
import '../../layout_cubit.dart';
import '../home/home_cubit.dart';
import '../more/address/address_cubit.dart';
import 'cart_cubit.dart';
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

                       //   SizedBox(height: 10.h,),
                       // const CustomTotalWidget(),
                        SizedBox(height: 20.h,),

                        Stack(
                          children: [
                            Container(
                                height: 160.h,
                                width: double.infinity,
                                child: SizedBox()
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 265.w,
                              child: Container(
                                height: 160.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(60),
                                        topRight: Radius.circular(60)
                                    )
                                ),
                                child: Center(),
                              ),
                            ),
                            Positioned(
                              bottom: 10.h,
                              top: 10.h,
                              left: 30.w,
                              right: 41.w,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(50),
                                        topLeft: Radius.circular(50)
                                    )
                                ),
                                child:
                                Column(
                                  mainAxisAlignment:  MainAxisAlignment.center,
                                  children: [
                                    BlackBoldText(label:'${cubit.totalPrice().toStringAsFixed(1)} ${LocaleKeys.lyd.tr()}',fontSize: 14.sp,
                                    ),
                                    verticalSpace(10),
                                    Center(
                                      child:
                                      CustomElevatedButton(
                                          borderRadius: 50,
                                          height: 43,
                                          fontColor: AppColors.whiteColor,
                                          fontSize: 16,
                                          width: MediaQuery.of(context).size.width*0.6,
                                          onTap: (){
                                            bool isUser= HomeCubit.get(context).token!=null&&HomeCubit.get(context).token!.isNotEmpty;
                                            if(isUser==true){
                                              if(cubit.products.isNotEmpty){
                                                CheckOutCubit.get(context).changeSteps(0);
                                                AddressCubit.get(context).getAllAddress();
                                                NavigationService.push(RoutesRestaurants.checkOut);
                                              }
                                              else{
                                                context.pushNamedAndRemoveUntil(RoutesRestaurants.categoriesScreen,predicate: (Route<dynamic> route) =>route.isFirst);
                                              }
                                            }else{
                                              showToast(text: LocaleKeys.logInFirst.tr(), state: ToastStates.error, context: context);
                                            }

                                          }, buttonText:cubit.products.isNotEmpty? LocaleKeys.checkout.tr():LocaleKeys.goToShopping.tr()),
                                    ),
                                  ],
                                )
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 60.h,),
                      ],
                    ),
                  );
              },
            )
    );

  }
}
