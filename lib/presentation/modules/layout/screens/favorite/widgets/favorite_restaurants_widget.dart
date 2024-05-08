import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/routing/routes.dart';
import 'package:cogina/core/translations/locale_keys.dart';
import 'package:cogina/presentation/component/custom_loading_widget.dart';
import 'package:cogina/presentation/modules/layout/screens/favorite/favorite_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/favorite/widgets/custom_favorite_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../data/model/response/category_item_model.dart';
import '../../../../../component/custom_not_found_data.dart';
import '../../../../restaurant/widgets/custom_restaurant_widget.dart';

class FavoriteRestaurantsWidget extends StatelessWidget {
  const FavoriteRestaurantsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteCubit cubit =FavoriteCubit.get(context);
    return RefreshIndicator(
      onRefresh: ()async{
        cubit.favoriteRestaurantModel=null;
        Future.delayed(Duration(seconds: 1)).then((value){
          cubit.getFavoriteRestaurant(context);
        });
      },
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(cubit.favoriteRestaurantModel!=null){
            if(cubit.favoriteRestaurantModel!.data!.isNotEmpty){
              return  ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cubit.favoriteRestaurantModel!.data!.length,
                  itemBuilder: (context, index) {
                    return  CustomRestaurantWidget(restaurantData: cubit.favoriteRestaurantModel!.data![index],);
                  });
            }else{
              return CustomNotFoundDataWidget(image: RestaurantImages.fav,title: LocaleKeys.notFoundData.tr(), type: 'svg',);
            }
          }
          else{
            return CustomLoadingWidget();
          }
        },
      ),
    );
  }
}
