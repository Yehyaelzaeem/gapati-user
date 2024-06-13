import 'package:cogina/presentation/component/component.dart';
import 'package:cogina/presentation/modules/layout/screens/home/home_cubit.dart';
import 'package:cogina/presentation/modules/restaurant/widgets/custom_restaurant_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../generated/locale_keys.g.dart';

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
            cubit.listData!=null?
            ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.listData!.length,
                itemBuilder: (context, index) {
                  return  CustomRestaurantWidget(restaurantData: cubit.listData![index],);
                }):
                const SizedBox.shrink()
        );
      },
    );
  }
}
