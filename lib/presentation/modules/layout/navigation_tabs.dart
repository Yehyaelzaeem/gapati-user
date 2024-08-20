import 'package:delivego/presentation/modules/layout/screens/cart/cart_cubit.dart';
import 'package:delivego/presentation/modules/layout/screens/cart/cart_screen.dart';
import 'package:delivego/presentation/modules/layout/screens/favorite/favorite_screen.dart';
import 'package:delivego/presentation/modules/layout/screens/more/more_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/tabs/tab.dart';
import '../../../../generated/assets.dart';
import '../../../core/global/styles/colors.dart';
import '../../../core/global/styles/styles.dart';
import '../../../core/routing/navigation_services.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import 'screens/home/home_screen.dart';
import 'screens/orders/orders_screen.dart';
import 'package:badges/badges.dart' as badges;


class NavigationTabs {
  /// Default constructor is private because this class will be only used for
  /// static fields and you should not instantiate it.
  NavigationTabs._();

  static const home = 0;
  static const favourite =1 ;
  static const orders = 2;
  static const cart   = 3;
  static const more= 4;


}
getDataTabs(){
  CartCubit cartCubit =CartCubit.get(NavigationService.navigationKey.currentContext!);
  List<NavigationTab> _kTabs = <NavigationTab>[
    NavigationTab(
      name: LocaleKeys.home.tr(),
      image: Assets.svgMoreNotificationIcon ,
      unSelectIcon:  Icon(CupertinoIcons.house),
      selectIcon:Icon(CupertinoIcons.house_fill),
      initialRoute: HomeScreen(),
      index: NavigationTabs.home,
    ),
    NavigationTab(
      name: LocaleKeys.favorite.tr(),
      image: Assets.svgMoreNotificationIcon ,
      unSelectIcon:Icon(Icons.favorite_border_rounded  ),
      selectIcon:  Icon(Icons.favorite),
      initialRoute: FavoriteScreen(),
      index: NavigationTabs.favourite,
    ),

    NavigationTab(
      name: LocaleKeys.orders.tr(),
      image: Assets.svgMoreNotificationIcon ,
      selectIcon: Icon(CupertinoIcons.square_list_fill),
      unSelectIcon: Icon(CupertinoIcons.square_list),
      initialRoute: OrdersScreen(),
      index: NavigationTabs.orders ,
    ),

    NavigationTab(
      name: LocaleKeys.cart.tr(),
      image: Assets.svgMoreNotificationIcon ,
      selectIcon:
      BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            children: [
              Container(child: Padding(
                padding:  EdgeInsets.only(top:cartCubit.products.isEmpty?0: 3.0,right: cartCubit.products.isEmpty?0:15),
                child: Icon(Icons.shopping_cart,),
              )),
              cartCubit.products.isNotEmpty?
              Positioned(
                child: Container(
                  height:16.h,
                  width:16.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.redColor
                  ),
                  child:
                  Center(
                    child: Center(
                      child: Text('${cartCubit.products.isNotEmpty?cartCubit.products.length:'0'}',
                        style: TextStyles.font14White500Weight.copyWith(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                top: 0,
                right: 0,
              ):SizedBox.shrink()
            ],
          );

        },
      ),

      unSelectIcon:
      BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            children: [
              Container(child: Padding(
                padding:  EdgeInsets.only(top:cartCubit.products.isEmpty?0: 3.0,right: cartCubit.products.isEmpty?0:15),
                child: Icon(Icons.shopping_cart_outlined,),
              )),
              cartCubit.products.isNotEmpty?
              Positioned(
                  child: Container(
                     height:16.h,
                     width:16.h,
                     decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.redColor
                         ),
                    child:
                    Center(
                      child: Center(
                        child: Text('${cartCubit.products.isNotEmpty?cartCubit.products.length:'0'}',
                          style: TextStyles.font14White500Weight.copyWith(
                            fontWeight: FontWeight.bold
                          ),

                        ),
                      ),
                    ),
                  ),
                top: 0,
                right: 0,
              ):SizedBox.shrink()
            ],
          );

        },
      ),
      initialRoute: CartScreen(isLayOut: true,),
      index: NavigationTabs.cart ,
    ),
    NavigationTab(
      name: LocaleKeys.more.tr(),
      image: Assets.svgMoreNotificationIcon ,
      selectIcon: Icon(Icons.menu),
      unSelectIcon: Icon(Icons.menu),
      initialRoute: MoreScreen(),
      index: NavigationTabs.more ,
    ),
  ];
  return _kTabs;
}
