import 'package:cogina/presentation/modules/restaurant/widgets/shimmer_categories_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/global/styles/colors.dart';
import '../../../../core/global/styles/styles.dart';
import '../meal_details/meal_details_screen.dart';
import '../restaurant_cubit.dart';
import 'custom_meal_widget.dart';

class CustomBestMealsWidget extends StatefulWidget {
  const CustomBestMealsWidget({super.key, this.padding, required this.categoryId, required this.storeId});
  final double? padding;
  final int categoryId;
  final int storeId;

  @override
  State<CustomBestMealsWidget> createState() => _CustomBestMealsWidgetState();
}

class _CustomBestMealsWidgetState extends State<CustomBestMealsWidget> {

  @override
  void initState() {
    super.initState();
    RestaurantCubit cubit =RestaurantCubit.get(context);
    cubit.getCategoryItems(categoryId: widget.categoryId, storeId:widget.storeId);
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
                                        storeId: cubit.categoryItemsModelList![index].storeId.toString(),)));
                                },
                                child:  CustomMealWidget(categoriesItemsModelData: cubit.categoryItemsModelList![index], storeId: cubit.categoryItemsModelList![index].storeId!.toString(),));
                          }),
                    );

                  }else{
                    return  Container(
                        decoration:  BoxDecoration(
                            color: AppColors.customWhite,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child:  Center(child: Text("No found data items",style: TextStyles.font18Black700Weight,),));
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
