
import 'package:delivego/presentation/modules/layout/screens/favorite/widgets/favorite_meals_widget.dart';
import 'package:delivego/presentation/modules/layout/screens/favorite/widgets/favorite_restaurants_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../component/custom_app_bar.dart';
import '../../../../component/tabview/tabbar_widget.dart';
import '../../../visitor/visitor_screen.dart';
import '../home/home_cubit.dart';
import 'favorite_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FavoriteCubit cubit =FavoriteCubit.get(context);
    return HomeCubit.get(context).token!=null&&HomeCubit.get(context).token!.isNotEmpty?
      Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.favorite.tr(),
          isBackButtonExist: false,
        ),
      body:
      FavoriteMealsWidget()
      // Column(
      //   children: [
      //     Expanded(
      //       child:
      //       TabBarWidget(tabs: [
      //         TabItemModel(
      //             label: LocaleKeys.meals.tr(),
      //             page: FavoriteMealsWidget()),
      //         TabItemModel(
      //             label: LocaleKeys.restaurants.tr(),
      //             page:  FavoriteRestaurantsWidget()
      //         ),
      //       ]),
      //     ),
      //   ],
      // ),
    ):
    CustomVisitorScreen(screenName: 'favorite',);


  }
}
/*

 */
