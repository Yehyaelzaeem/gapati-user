import 'package:delivego/presentation/component/custom_loading_widget.dart';
import 'package:delivego/presentation/component/custom_not_found_data.dart';
import 'package:delivego/presentation/modules/layout/screens/home/home_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/assets_constant/images.dart';
import '../../../../../../../data/model/response/category_item_model.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../../../component/custom_app_bar.dart';
import '../../../../../restaurant/widgets/custom_meal_widget.dart';


class BestDishMealsScreen extends StatefulWidget {

  const BestDishMealsScreen({super.key,});

  @override
  State<BestDishMealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<BestDishMealsScreen> {
  @override
  void initState() {
    HomeCubit cubit = HomeCubit.get(context);
    cubit.getBestDishes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return Scaffold(
      appBar:CustomAppBar(
        title: LocaleKeys.bestDish2.tr(),

      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(cubit.bestDishModel!=null){
            if(cubit.bestDishModel!.data!=null && cubit.bestDishModel!.data!.isNotEmpty){
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: cubit.bestDishModel!.data!.length,
                itemBuilder: (context,index){
                            return CustomMealWidget(
                              categoriesItemsModelData:
                                  CategoryItemsData(
                                    id:
                                    cubit.bestDishModel!.data![index].id??0,
                                    name: cubit.bestDishModel!.data![index].name??'',
                                    description: cubit.bestDishModel!.data![index].description??'',
                                    categoryId: cubit.bestDishModel!.data![index].categoryId??0,
                                    categoryName: cubit.bestDishModel!.data![index].categoryName??'',
                                    price: cubit.bestDishModel!.data![index].price??0,
                                    priceDiscount: cubit.bestDishModel!.data![index].priceDiscount??0,
                                    priceAfterDiscount: cubit.bestDishModel!.data![index].priceAfterDiscount??0,
                                    storeId: cubit.bestDishModel!.data![index].storeId??0,
                                    image: cubit.bestDishModel!.data![index].image??'',
                                    inCart: cubit.bestDishModel!.data![index].incart??false,
                                    inFav: cubit.bestDishModel!.data![index].inFav??false,
                                  ),
                              storeName: '${LocaleKeys.bestDish2.tr()}',
                            );
                            },
              );
            }
            else{
              return CustomNotFoundDataWidget(image: AppImages.cart,title: LocaleKeys.notFoundData.tr(), type: 'svg',);
            }
          }else{
            return CustomLoadingWidget();
          }

        },

      )
    );
  }
}

