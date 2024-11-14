import 'package:delivego/presentation/component/custom_loading_widget.dart';
import 'package:delivego/presentation/component/custom_not_found_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/custom_app_bar.dart';
import '../../../../restaurant/restaurant_cubit.dart';
import '../../../../restaurant/widgets/custom_meal_widget.dart';
import '../home_cubit.dart';

class MealsScreen extends StatefulWidget {
  final int categoryId;
  final String categoryName;
  const MealsScreen({super.key, required this.categoryId, required this.categoryName});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  void initState() {
    RestaurantCubit cubit = RestaurantCubit.get(context);
    cubit.getCategoryItems(categoryId: widget.categoryId, storeId:1, branchId: 1);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    RestaurantCubit cubit = RestaurantCubit.get(context);
    return Scaffold(
      appBar:CustomAppBar(
        title: widget.categoryName,
      ),
      body: BlocConsumer<RestaurantCubit, RestaurantState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(cubit.categoryItemsModelList!=null){
            if(cubit.categoryItemsModelList!.isNotEmpty){
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: cubit.categoryItemsModelList!.length,
                itemBuilder: (context,index){
                            return CustomMealWidget(
                              categoriesItemsModelData:
                              cubit.categoryItemsModelList![index],
                              storeName: widget.categoryName,
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

