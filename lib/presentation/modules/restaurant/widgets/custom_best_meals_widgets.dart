import 'package:delivego/presentation/modules/restaurant/widgets/shimmer_categories_restaurant.dart';

import '../../../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/global/styles/colors.dart';
import '../../../../core/global/styles/styles.dart';
import '../../../../data/model/response/category_item_model.dart';
import '../../layout/screens/home/meal/meal_details/meal_details_screen.dart';
import '../restaurant_cubit.dart';
import 'custom_meal_widget.dart';

class CustomBestMealsWidget extends StatefulWidget {
  const CustomBestMealsWidget({super.key, this.padding, required this.categoryId, required this.storeId, required this.storeName, required this.branchId});
  final double? padding;
  final int categoryId;
  final int branchId;
  final int storeId;
  final String storeName;

  @override
  State<CustomBestMealsWidget> createState() => _CustomBestMealsWidgetState();
}

class _CustomBestMealsWidgetState extends State<CustomBestMealsWidget> {

  @override
  void initState() {
    RestaurantCubit cubit =RestaurantCubit.get(context);
    cubit.getCategoryItems(categoryId: widget.categoryId, storeId:widget.storeId, branchId: widget.branchId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    RestaurantCubit cubit =RestaurantCubit.get(context);

    return
      BlocConsumer<RestaurantCubit, RestaurantState>(
              listener: (context, state) {},
              builder: (context, state) {
                if(cubit.categoryItemsModelList!=null){
                  if(cubit.categoryItemsModelList!.isNotEmpty){
                    return Padding(
                      padding:  EdgeInsets.all(widget.padding??0),
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          itemCount: cubit.categoryItemsModelList!.length,
                          itemBuilder: (context,index){
                            return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                      MealDetailsScreen(categoriesItemsModelData: cubit.categoryItemsModelList![index],
                                        storeId: cubit.categoryItemsModelList![index].storeId.toString(), storeName: widget.storeName, type: 'details', count: 0,)));
                                },
                                child: CustomMealWidget(categoriesItemsModelData: cubit.categoryItemsModelList![index], storeName: widget.storeName,));
                          }),
                    );

                  }else{
                    return  Container(
                        decoration:  BoxDecoration(
                            color: AppColors.customWhite,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child:  Center(child: Text(LocaleKeys.notFoundData.tr(),style: TextStyles.font18Black700Weight,),));
              }
                }else{
                  return  Container(
                      decoration:  BoxDecoration(
                          color: AppColors.customWhite,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: const CategoriesRestaurantShimmer());
                }
              },
           );
  }
}

class BestDishWidget extends StatelessWidget {
  final double? padding;
  final int categoryId;
  final int branchId;
  final int storeId;
  final String storeName;
  const BestDishWidget({super.key, this.padding, required this.categoryId, required this.branchId, required this.storeId, required this.storeName});

  @override
  Widget build(BuildContext context) {
    RestaurantCubit cubit =RestaurantCubit.get(context);
    return BlocConsumer<RestaurantCubit, RestaurantState>(
      listener: (context, state) {},
      builder: (context, state) {
        if(cubit.bestDishModel!=null){
          if(cubit.bestDishModel!.data!=null && cubit.bestDishModel!.data!.isNotEmpty){
            return Padding(
              padding:  EdgeInsets.all(padding??10),
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  itemCount: cubit.bestDishModel?.data?.length??0,
                  itemBuilder: (context,index){
                    return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              MealDetailsScreen(categoriesItemsModelData:
                              CategoryItemsData(id:
                              cubit.bestDishModel?.data?[index].id??0,
                                  name: cubit.bestDishModel?.data?[index].name??'',
                                  description: cubit.bestDishModel?.data?[index].description??'',
                                  categoryId: cubit.bestDishModel?.data?[index].categoryId??0,
                                  categoryName: cubit.bestDishModel?.data?[index].categoryName??'',
                                  price: cubit.bestDishModel?.data?[index].price??0,
                                  priceDiscount: cubit.bestDishModel?.data?[index].priceDiscount??0,
                                  priceAfterDiscount: cubit.bestDishModel?.data?[index].priceAfterDiscount??0,
                                  storeId: cubit.bestDishModel?.data?[index].storeId??0,
                                  image: cubit.bestDishModel?.data?[index].image??'',
                                  inCart: cubit.bestDishModel?.data?[index].incart??false,
                                  inFav: cubit.bestDishModel?.data?[index].inFav??false,
                                  count: 0),
                                storeId: cubit.bestDishModel?.data?[index].storeId?.toString()??'0', storeName: storeName, type: 'details', count: 0,)));
                        },
                        child: CustomMealWidget(categoriesItemsModelData:
                        CategoryItemsData(id:
                        cubit.bestDishModel?.data?[index].id??0,
                            name: cubit.bestDishModel?.data?[index].name??'',
                            description: cubit.bestDishModel?.data?[index].description??'',
                            categoryId: cubit.bestDishModel?.data?[index].categoryId??0,
                            categoryName: cubit.bestDishModel?.data?[index].categoryName??'',
                            price: cubit.bestDishModel?.data?[index].price??0,
                            priceDiscount: cubit.bestDishModel?.data?[index].priceDiscount??0,
                            priceAfterDiscount: cubit.bestDishModel?.data?[index].priceAfterDiscount??0,
                            storeId: cubit.bestDishModel?.data?[index].storeId??0,
                            image: cubit.bestDishModel?.data?[index].image??'',
                            inCart: cubit.bestDishModel?.data?[index].incart??false,
                            inFav: cubit.bestDishModel?.data?[index].inFav??false,
                            count: 0), storeName: storeName,));
                  }),
            );

          }else{
            return  Container(
                decoration:  BoxDecoration(
                    color: AppColors.customWhite,
                    borderRadius: BorderRadius.circular(20)
                ),
                child:  Center(child: Text(LocaleKeys.notFoundData.tr(),style: TextStyles.font18Black700Weight,),));
          }
        }else{
          return  Container(
              decoration:  BoxDecoration(
                  color: AppColors.customWhite,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: const CategoriesRestaurantShimmer());
        }
      },
    );
  }
}


