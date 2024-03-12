

import 'package:cogina/presentation/modules/layout/screens/cart/cart_screen.dart';
import 'package:cogina/presentation/modules/layout/screens/favorite/favorite_screen.dart';
import 'package:cogina/presentation/modules/layout/screens/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../../../core/tabs/tab.dart';
import '../../../generated/assets.dart';
import '../../../generated/locale_keys.g.dart';
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
  static const profile= 4;


}

const List<NavigationTab> kTabs = <NavigationTab>[
  NavigationTab(
    name: LocaleKeys.home,
    image: Assets.svgMoreNotificationIcon ,
    unSelectIcon:  CupertinoIcons.house,
    selectIcon:CupertinoIcons.house_fill,
    initialRoute: HomeScreen(),
    index: NavigationTabs.home,
  ),
  NavigationTab(
    name: LocaleKeys.favorite,
    image: Assets.svgMoreNotificationIcon ,
    unSelectIcon:Icons.favorite_border_rounded  ,
    selectIcon:  Icons.favorite,
    initialRoute: FavoriteScreen(),
    index: NavigationTabs.favourite,
  ),

  NavigationTab(
    name: LocaleKeys.orders,
    image: Assets.svgMoreNotificationIcon ,
    selectIcon: CupertinoIcons.square_list_fill,
    unSelectIcon: CupertinoIcons.square_list,
    initialRoute: OrdersScreen(),
    index: NavigationTabs.orders ,
  ),


  NavigationTab(
    name: LocaleKeys.cart,
    image: Assets.svgMoreNotificationIcon ,
    selectIcon: Icons.shopping_cart,
    unSelectIcon: Icons.shopping_cart_outlined,
    initialRoute: CartScreen(isLayOut: true,),
    index: NavigationTabs.cart ,
  ),
  NavigationTab(
    name: LocaleKeys.profile,
    image: Assets.svgMoreNotificationIcon ,
    selectIcon: Icons.person,
    unSelectIcon: Icons.person_outline_rounded,
    initialRoute: ProfileScreen(),
    index: NavigationTabs.profile ,
  ),
];
