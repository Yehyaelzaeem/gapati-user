
import 'package:delivego/presentation/modules/restaurant/widgets/custom_restaurant_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../generated/locale_keys.g.dart';
import '../../component/custom_app_bar.dart';
import '../layout/screens/home/home_cubit.dart';

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit =HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar:  CustomAppBar(
              title: LocaleKeys.restaurants.tr(),
            ),
            body:
            cubit.restaurantList!=null?
            ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.restaurantList!.length,
                itemBuilder: (context, index) {
                  return  CustomRestaurantWidget(restaurant: cubit.restaurantList![index],);
                }):
                const SizedBox.shrink()
        );
      },
    );
  }
}
