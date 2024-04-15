
import 'package:cogina/presentation/modules/layout/screens/cart/cart_screen.dart';
import 'package:cogina/presentation/modules/layout/screens/favorite/favorite_screen.dart';
import 'package:cogina/presentation/modules/layout/screens/more/more_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/tabs/tab.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../core/translations/locale_keys.dart';
import 'screens/home/home_screen.dart';
import 'screens/orders/orders_screen.dart';


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
  List<NavigationTab> _kTabs = <NavigationTab>[
    NavigationTab(
      name: LocaleKeys.home.tr(),
      image: Assets.svgMoreNotificationIcon ,
      unSelectIcon:  CupertinoIcons.house,
      selectIcon:CupertinoIcons.house_fill,
      initialRoute: HomeScreen(),
      index: NavigationTabs.home,
    ),
    NavigationTab(
      name: LocaleKeys.favorite.tr(),
      image: Assets.svgMoreNotificationIcon ,
      unSelectIcon:Icons.favorite_border_rounded  ,
      selectIcon:  Icons.favorite,
      initialRoute: FavoriteScreen(),
      index: NavigationTabs.favourite,
    ),

    NavigationTab(
      name: LocaleKeys.orders.tr(),
      image: Assets.svgMoreNotificationIcon ,
      selectIcon: CupertinoIcons.square_list_fill,
      unSelectIcon: CupertinoIcons.square_list,
      initialRoute: OrdersScreen(),
      index: NavigationTabs.orders ,
    ),

    NavigationTab(
      name: LocaleKeys.cart.tr(),
      image: Assets.svgMoreNotificationIcon ,
      selectIcon: Icons.shopping_cart,
      unSelectIcon: Icons.shopping_cart_outlined,
      initialRoute: CartScreen(isLayOut: true,),
      index: NavigationTabs.cart ,
    ),
    NavigationTab(
      name: LocaleKeys.more.tr(),
      image: Assets.svgMoreNotificationIcon ,
      selectIcon: Icons.menu,
      unSelectIcon: Icons.menu,
      initialRoute: MoreScreen(),
      index: NavigationTabs.more ,
    ),
  ];
  return _kTabs;
}
