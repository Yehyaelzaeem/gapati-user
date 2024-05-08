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

class FavoriteMealsWidget extends StatelessWidget {
  const FavoriteMealsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteCubit cubit =FavoriteCubit.get(context);
    return RefreshIndicator(
        onRefresh: ()async{
          cubit.favoriteModel=null;
          Future.delayed(Duration(seconds: 1)).then((value){
            cubit.getFavorite(context);
          });
        },
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(cubit.favoriteModel!=null){
            if(cubit.favoriteModel!.data!.isNotEmpty){
              return Padding(
                padding:  EdgeInsets.only(bottom: 50.h),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 9.w,
                    mainAxisSpacing: 15.h,
                    mainAxisExtent: 210.h,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final favoriteItem =cubit.favoriteModel!.data![index];
                    return InkWell(
                        onTap: (){
                          CategoryItemsData categoryItemsData=CategoryItemsData(
                            id: favoriteItem.id,
                            name: favoriteItem.name,
                            description: favoriteItem.description,
                            categoryId: favoriteItem.categoryId,
                            categoryName: favoriteItem.categoryName,
                            price: favoriteItem.price,
                            priceDiscount: favoriteItem.priceDiscount,
                            priceAfterDiscount: favoriteItem.priceAfterDiscount,
                            storeId: favoriteItem.storeId,
                            image: favoriteItem.image,
                            inCart: favoriteItem.incart,
                            inFav: favoriteItem.inFav,
                          );
                          context.pushNamed(RoutesRestaurants.mealDetailsScreen,arguments: {
                            'storeId':favoriteItem.storeId.toString(),'storeName':'','categoriesItemsModelData':categoryItemsData});
                        },
                        child: CustomFavoriteItem(favoriteModelData: favoriteItem,));
                  },
                  shrinkWrap: true,
                  itemCount: cubit.favoriteModel!.data!.length,
                  padding: EdgeInsets.all(16.w),
                ),
              );
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
