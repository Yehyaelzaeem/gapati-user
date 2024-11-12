import 'package:delivego/core/helpers/extensions.dart';
import 'package:delivego/core/routing/routes.dart';
import 'package:delivego/presentation/modules/restaurant/meal_details/widget/custom_name_price_widget.dart';
import 'package:delivego/presentation/modules/restaurant/meal_details/widget/custom_offer_widget.dart';
import 'package:delivego/presentation/modules/restaurant/meal_details/widget/custom_shimmer_chip.dart';
import 'package:delivego/presentation/modules/restaurant/meal_details/widget/custom_top_back_widget.dart';
import 'package:delivego/presentation/modules/restaurant/meal_details/widget/custom_top_fav_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

import '../../../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/navigation_services.dart';
import '../../../../data/model/response/category_item_model.dart';
import '../../../../data/model/response/item_extra_model.dart';
import '../../../component/custom_add_cart_button.dart';
import '../../../component/custom_multi_select_chip.dart';
import '../../../component/drop_dowen_multi_select_widget.dart';
import '../../../component/images/custom_image.dart';
import '../../layout/screens/cart/cart_cubit.dart';
import '../restaurant_cubit.dart';

class MealDetailsScreen extends StatelessWidget {
  MealDetailsScreen(
      {super.key,
      this.categoriesItemsModelData,
      required this.storeId,
      required this.storeName,
      required this.type,
      required this.count,
      this.itemExtraList});

  final CategoryItemsData? categoriesItemsModelData;
  final String storeId;
  final String type;
  final String storeName;
  int count;
  final List<ItemExtraModelData>? itemExtraList;

  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit = CartCubit.get(context);
    RestaurantCubit cubit = RestaurantCubit.get(context);
    cubit.getItemExtra(id: categoriesItemsModelData!.id!,)
        .then((value) {});
    return WillPopScope(
        onWillPop: () {
          cartCubit.updateData();
          context.pop();
          return Future.value(false);
        },
        child:
        Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<CartCubit, CartState>(
            // listener: (context, state) {},
            builder: (context, state) {
              return
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                  Stack(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.4,
                                child: CustomImage(image:categoriesItemsModelData?.image??'')),


                          ],
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 280.h, width: 375.w,),
                          Container(
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomNamePriceWidget(
                                    categoriesItemsModelData: categoriesItemsModelData??CategoryItemsData(),
                                    name:  categoriesItemsModelData!.name!,priceDiscount:categoriesItemsModelData!.priceDiscount!=null?categoriesItemsModelData!.priceDiscount!:null,
                                    price:categoriesItemsModelData!.price!=null?categoriesItemsModelData!.price.toString():null,
                                    priceAfterDiscount:categoriesItemsModelData!.priceAfterDiscount!=null?categoriesItemsModelData!.priceAfterDiscount.toString():null,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 0.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          LocaleKeys.description.tr(),
                                          style: TextStyles.font18Black700Weight.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: AppColors.black),
                                        ),
                                        Text(
                                          '${categoriesItemsModelData!.description}',
                                          style: TextStyles.font18Black700Weight.copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: AppColors.customGray),
                                        ),
                                        verticalSpace(15),
                                        BlocConsumer<RestaurantCubit, RestaurantState>(
                                          listener: (context, state) {},
                                          builder: (context, state) {

                                            return
                                              cubit.itemExtraModelDataList!=null?
                                              cubit.itemExtraModelDataList!.isNotEmpty ?
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        vertical: 0,
                                                        horizontal: 0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          LocaleKeys.extraComponents.tr(),
                                                          style: TextStyles.font18Black700Weight.copyWith(
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 16,
                                                              color: AppColors.black),
                                                        ),
                                                        verticalSpace(15),


                                                        StatefulBuilder(builder: (context,setState){
                                                          // categoriesItemsModelData!.itemExtraModelMain!=cubit.itemExtraModelDataList;
                                                          List<ItemExtraModelData>? initialSelection;
                                                          if(cartCubit.products.isNotEmpty&&type!='cart'){
                                                            if(cartCubit.products.where((element) =>
                                                            element.id==categoriesItemsModelData!.id!).length!=0){
                                                              CategoryItemsData lastProducts =cartCubit.products.lastWhere((element) =>
                                                              element.id==categoriesItemsModelData!.id!);
                                                              if(cartCubit.products.where((element) =>
                                                              element.id==categoriesItemsModelData!.id!).length!=0){
                                                                initialSelection = cubit.itemExtraModelDataList!.where((element) =>
                                                                lastProducts.itemExtraModelDataSelected!=null&&lastProducts.itemExtraModelDataSelected!.isNotEmpty&&
                                                                    lastProducts.itemExtraModelDataSelected!.any((e) => e.id == element.id)).toList();
                                                              }
                                                            }
                                                          }

                                                          List<DropDownItemData>? itemsInitialSelection = [];

                                                          if (type == 'cart') {
                                                            itemsInitialSelection = cubit.itemExtraModelDataList
                                                                ?.where((item) =>
                                                            itemExtraList?.any((element) => element.id == item.id) ?? false)
                                                                .map((item) =>
                                                                DropDownItemData(id: item.id.toString(), title: item.name.toString(), value:item.price.toString()))
                                                                .toList();
                                                          } else {
                                                            itemsInitialSelection = initialSelection?.map((item) =>  DropDownItemData(id: item.id.toString(), title: item.name.toString(), value:item.price.toString()))
                                                                .toList()??[];
                                                          }
                                                          return Column(
                                                            children: [
                                                              DropdownMultiSelectWidget(
                                                                  selectedItems: (List<DropDownItemData> selectedItems ) {
                                                                    categoriesItemsModelData!.itemExtraModelDataSelected = selectedItems.map((e) => ItemExtraModelData(
                                                                      id: int.parse(e.id),
                                                                      name: e.title,
                                                                      price: e.value,
                                                                    )).toList();
                                                                    if(type=='cart'){
                                                                      if (cartCubit.products.where((CategoryItemsData element) => element.id == categoriesItemsModelData!.id ).toList().length > 0){
                                                                        cartCubit.updateExtra(categoriesItemsModelData!,  selectedItems.map((e) => ItemExtraModelData(
                                                                          id: int.parse(e.id),
                                                                          name: e.title,
                                                                          price: e.value,
                                                                        )).toList());
                                                                      }
                                                                    }

                                                                  },
                                                                  hint: LocaleKeys.extraComponents.tr(),
                                                                  items:  cubit.itemExtraModelDataList?.map((e) =>
                                                                      DropDownItemData(id: e.id.toString(), title: e.name??'', value:e.price??'0')).toList()??[],
                                                                  itemsInitialSelection: itemsInitialSelection??[]
                                                              ),
                                                              verticalSpace(20),
                                                              // MultiSelectChip(
                                                              //     onSelectionChanged: (value){
                                                              //       categoriesItemsModelData!.itemExtraModelDataSelected = value.map((e) => e).toList();
                                                              //       // log('value d', value.map((e) => e.toJson()).toList().toString());
                                                              //       if(type=='cart'){
                                                              //         if (cartCubit.products.where((CategoryItemsData element) => element.id == categoriesItemsModelData!.id ).toList().length > 0){
                                                              //           cartCubit.updateExtra(categoriesItemsModelData!, value.map((e) => e).toList());
                                                              //         }
                                                              //       }
                                                              //     },
                                                              //     reportList: cubit.itemExtraModelDataList!,
                                                              //     initialSelection:
                                                              //     type=='cart'?
                                                              //     cubit.itemExtraModelDataList?.where((item) =>
                                                              //     itemExtraList?.any((element) => element.id == item.id) ?? false).toList() :initialSelection
                                                              //
                                                              // ),

                                                            ],
                                                          );
                                                        })
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ): const SizedBox.shrink()
                                                  : Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      CustomShimmerChip(),
                                                      CustomShimmerChip(),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      CustomShimmerChip(),
                                                      CustomShimmerChip(),
                                                    ],
                                                  ),
                                                ],
                                              );
                                          },
                                        ),
                                        SizedBox(height: 15.h,),
                                      ],
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                          height: 170.h,
                                          width: double.infinity,
                                          child: SizedBox()
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 265.w,
                                        child: Container(
                                          height: 170.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(60),
                                                  topRight: Radius.circular(60)
                                              )
                                          ),
                                          child: Center(),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 25.h,
                                        top: 25.h,
                                        left: 50.w,
                                        right: 41.w,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.whiteColor,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(50),
                                                  topLeft: Radius.circular(50)
                                              )
                                          ),
                                          child:  Center(
                                            child: CustomAddCartButton(
                                              hasTotal: true,
                                              type: type,
                                              width: 200.w,
                                              categoriesItemsModelData:  categoriesItemsModelData!, storeName: storeName,),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 50.h,
                                        right: 41.w,
                                        child: Container(
                                            child:  InkWell(
                                              child: Icon(Icons.shopping_cart,
                                                color: AppColors.primaryColor,),
                                              onTap: (){
                                                NavigationService.push(
                                                    RoutesRestaurants.cartScreen,
                                                    arguments: {'isLayout': false});

                                              },
                                            )
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              )),
                          SizedBox(height: 50.h,),
                        ],
                      ),
                    ),
                    CustomTopFavWidget(categoryItemsData: categoriesItemsModelData?? CategoryItemsData(),),
                    CustomTopBackWidget(type: type,),
                  ],
                )
                  ],
                ),
              );
            },
          ),
        ),);
  }
}

 // Widget ssads (){
 //  return Scaffold(
 //    backgroundColor: Colors.white,
 //    body: BlocBuilder<CartCubit, CartState>(
 //      // listener: (context, state) {},
 //      builder: (context, state) {
 //        return Stack(
 //          fit:StackFit.expand ,
 //          children: [
 //            Stack(
 //              children: [
 //                SizedBox(
 //                    width: MediaQuery.of(context).size.width,
 //                    height: MediaQuery.of(context).size.height * 0.4,
 //                    child: CustomImage(image:categoriesItemsModelData?.image??'')),
 //                CustomTopBackWidget(type: type,),
 //
 //              ],
 //            ),
 //            Positioned.fill(
 //                top: MediaQuery.of(context).size.height * 0.25,
 //                child:
 //                Stack(
 //                  children: [
 //                    Positioned(
 //                      top: MediaQuery.of(context).size.height * 0.10,
 //                      left: 0,
 //                      right: 0,
 //                      child:  SingleChildScrollView(
 //                        padding: EdgeInsets.only(bottom: 100.h),
 //                        physics: BouncingScrollPhysics(),
 //                        child:
 //                        Column(
 //                          children: [
 //                            Container(
 //                                decoration: BoxDecoration(
 //                                    color: AppColors.whiteColor,
 //                                    borderRadius: BorderRadius.circular(20)),
 //                                child: Column(
 //                                  crossAxisAlignment: CrossAxisAlignment.start,
 //                                  children: [
 //                                    CustomNamePriceWidget(
 //                                      categoriesItemsModelData: categoriesItemsModelData??CategoryItemsData(),
 //                                      name:  categoriesItemsModelData!.name!,priceDiscount:categoriesItemsModelData!.priceDiscount!=null?categoriesItemsModelData!.priceDiscount!:null,
 //                                      price:categoriesItemsModelData!.price!=null?categoriesItemsModelData!.price.toString():null,
 //                                      priceAfterDiscount:categoriesItemsModelData!.priceAfterDiscount!=null?categoriesItemsModelData!.priceAfterDiscount.toString():null,
 //                                    ),
 //                                    Padding(
 //                                      padding: EdgeInsets.symmetric(
 //                                          horizontal: 16.w, vertical: 0.h),
 //                                      child: Column(
 //                                        crossAxisAlignment: CrossAxisAlignment.start,
 //                                        children: [
 //                                          Text(
 //                                            LocaleKeys.description.tr(),
 //                                            style: TextStyles.font18Black700Weight.copyWith(
 //                                                fontWeight: FontWeight.w500,
 //                                                fontSize: 16,
 //                                                color: AppColors.black),
 //                                          ),
 //                                          Text(
 //                                            '${categoriesItemsModelData!.description}',
 //                                            style: TextStyles.font18Black700Weight.copyWith(
 //                                                fontWeight: FontWeight.w400,
 //                                                fontSize: 12,
 //                                                color: AppColors.customGray),
 //                                          ),
 //                                          verticalSpace(15),
 //                                          BlocConsumer<RestaurantCubit, RestaurantState>(
 //                                            listener: (context, state) {},
 //                                            builder: (context, state) {
 //
 //                                              return
 //                                                cubit.itemExtraModelDataList!=null?
 //                                                cubit.itemExtraModelDataList!.isNotEmpty ?
 //                                                Column(
 //                                                  crossAxisAlignment: CrossAxisAlignment.start,
 //                                                  children: [
 //                                                    Padding(
 //                                                      padding: const EdgeInsets.symmetric(
 //                                                          vertical: 0,
 //                                                          horizontal: 0),
 //                                                      child: Column(
 //                                                        crossAxisAlignment: CrossAxisAlignment.start,
 //                                                        children: [
 //                                                          Text(
 //                                                            LocaleKeys.extraComponents.tr(),
 //                                                            style: TextStyles.font18Black700Weight.copyWith(
 //                                                                fontWeight: FontWeight.w500,
 //                                                                fontSize: 16,
 //                                                                color: AppColors.black),
 //                                                          ),
 //                                                          verticalSpace(15),
 //
 //
 //                                                          StatefulBuilder(builder: (context,setState){
 //                                                            // categoriesItemsModelData!.itemExtraModelMain!=cubit.itemExtraModelDataList;
 //                                                            List<ItemExtraModelData>? initialSelection;
 //                                                            if(cartCubit.products.isNotEmpty&&type!='cart'){
 //                                                              if(cartCubit.products.where((element) =>
 //                                                              element.id==categoriesItemsModelData!.id!).length!=0){
 //                                                                CategoryItemsData lastProducts =cartCubit.products.lastWhere((element) =>
 //                                                                element.id==categoriesItemsModelData!.id!);
 //                                                                if(cartCubit.products.where((element) =>
 //                                                                element.id==categoriesItemsModelData!.id!).length!=0){
 //                                                                  initialSelection = cubit.itemExtraModelDataList!.where((element) =>
 //                                                                  lastProducts.itemExtraModelDataSelected!=null&&lastProducts.itemExtraModelDataSelected!.isNotEmpty&&
 //                                                                      lastProducts.itemExtraModelDataSelected!.any((e) => e.id == element.id)).toList();
 //                                                                }
 //                                                              }
 //                                                            }
 //                                                            List<DropDownItemData>? itemsInitialSelection = [];
 //
 //                                                            if (type == 'cart') {
 //                                                              itemsInitialSelection = cubit.itemExtraModelDataList
 //                                                                  ?.where((item) =>
 //                                                              itemExtraList?.any((element) => element.id == item.id) ?? false)
 //                                                                  .map((item) =>
 //                                                                  DropDownItemData(id: item.id.toString(), title: item.name.toString(), value:item.price.toString()))
 //                                                                  .toList();
 //                                                            } else {
 //                                                              itemsInitialSelection = initialSelection?.map((item) =>  DropDownItemData(id: item.id.toString(), title: item.name.toString(), value:item.price.toString()))
 //                                                                  .toList()??[];
 //                                                            }
 //                                                            return Column(
 //                                                              children: [
 //                                                                DropdownMultiSelectWidget(
 //                                                                    selectedItems: (List<DropDownItemData> selectedItems ) {
 //                                                                      categoriesItemsModelData!.itemExtraModelDataSelected = selectedItems.map((e) => ItemExtraModelData(
 //                                                                        id: int.parse(e.id),
 //                                                                        name: e.title,
 //                                                                        price: e.value,
 //                                                                      )).toList();
 //                                                                      if(type=='cart'){
 //                                                                        if (cartCubit.products.where((CategoryItemsData element) => element.id == categoriesItemsModelData!.id ).toList().length > 0){
 //                                                                          cartCubit.updateExtra(categoriesItemsModelData!,  selectedItems.map((e) => ItemExtraModelData(
 //                                                                            id: int.parse(e.id),
 //                                                                            name: e.title,
 //                                                                            price: e.value,
 //                                                                          )).toList());
 //                                                                        }
 //                                                                      }
 //
 //                                                                    },
 //                                                                    hint: LocaleKeys.extraComponents.tr(),
 //                                                                    items:  cubit.itemExtraModelDataList?.map((e) =>
 //                                                                        DropDownItemData(id: e.id.toString(), title: e.name??'', value:e.price??'0')).toList()??[],
 //                                                                    itemsInitialSelection: itemsInitialSelection??[]
 //                                                                ),
 //                                                                verticalSpace(20),
 //                                                                // MultiSelectChip(
 //                                                                //     onSelectionChanged: (value){
 //                                                                //       categoriesItemsModelData!.itemExtraModelDataSelected = value.map((e) => e).toList();
 //                                                                //       // log('value d', value.map((e) => e.toJson()).toList().toString());
 //                                                                //       if(type=='cart'){
 //                                                                //         if (cartCubit.products.where((CategoryItemsData element) => element.id == categoriesItemsModelData!.id ).toList().length > 0){
 //                                                                //           cartCubit.updateExtra(categoriesItemsModelData!, value.map((e) => e).toList());
 //                                                                //         }
 //                                                                //       }
 //                                                                //     },
 //                                                                //     reportList: cubit.itemExtraModelDataList!,
 //                                                                //     initialSelection:
 //                                                                //     type=='cart'?
 //                                                                //     cubit.itemExtraModelDataList?.where((item) =>
 //                                                                //     itemExtraList?.any((element) => element.id == item.id) ?? false).toList() :initialSelection
 //                                                                //
 //                                                                // ),
 //
 //                                                              ],
 //                                                            );
 //                                                          })
 //                                                        ],
 //                                                      ),
 //                                                    )
 //                                                  ],
 //                                                ): const SizedBox.shrink()
 //                                                    : Column(
 //                                                  children: [
 //                                                    Row(
 //                                                      children: [
 //                                                        CustomShimmerChip(),
 //                                                        CustomShimmerChip(),
 //                                                      ],
 //                                                    ),
 //                                                    Row(
 //                                                      children: [
 //                                                        CustomShimmerChip(),
 //                                                        CustomShimmerChip(),
 //                                                      ],
 //                                                    ),
 //                                                  ],
 //                                                );
 //                                            },
 //                                          ),
 //                                          SizedBox(height: 15.h,),
 //
 //
 //
 //                                        ],
 //                                      ),
 //                                    ),
 //                                    Stack(
 //                                      children: [
 //                                        Container(
 //                                            height: 170.h,
 //                                            width: double.infinity,
 //                                            child: SizedBox()
 //                                        ),
 //                                        Positioned(
 //                                          bottom: 0,
 //                                          left: 0,
 //                                          right: 265.w,
 //                                          child: Container(
 //                                            height: 170.h,
 //                                            width: 50.w,
 //                                            decoration: BoxDecoration(
 //                                                color: AppColors.primaryColor,
 //                                                borderRadius: BorderRadius.only(
 //                                                    bottomRight: Radius.circular(60),
 //                                                    topRight: Radius.circular(60)
 //                                                )
 //                                            ),
 //                                            child: Center(),
 //                                          ),
 //                                        ),
 //                                        Positioned(
 //                                          bottom: 25.h,
 //                                          top: 25.h,
 //                                          left: 50.w,
 //                                          right: 41.w,
 //                                          child: Container(
 //                                            decoration: BoxDecoration(
 //                                                color: AppColors.whiteColor,
 //                                                borderRadius: BorderRadius.only(
 //                                                    bottomLeft: Radius.circular(50),
 //                                                    topLeft: Radius.circular(50)
 //                                                )
 //                                            ),
 //                                            child:  Center(
 //                                              child: CustomAddCartButton(
 //                                                hasTotal: true,
 //                                                type: type,
 //                                                width: 200.w,
 //                                                categoriesItemsModelData:  categoriesItemsModelData!, storeName: storeName,),
 //                                            ),
 //                                          ),
 //                                        ),
 //                                        Positioned(
 //                                          top: 50.h,
 //                                          right: 41.w,
 //                                          child: Container(
 //                                              child:  InkWell(
 //                                                child: Icon(Icons.shopping_cart,
 //                                                  color: AppColors.primaryColor,),
 //                                                onTap: (){
 //                                                  NavigationService.push(
 //                                                      RoutesRestaurants.cartScreen,
 //                                                      arguments: {'isLayout': false});
 //
 //                                                },
 //                                              )
 //                                          ),
 //                                        ),
 //                                      ],
 //                                    ),
 //
 //                                  ],
 //                                )),
 //                          ],
 //                        ),
 //                      ),),
 //                  ],
 //                )),
 //
 //
 //            CustomTopFavWidget(categoryItemsData: categoriesItemsModelData?? CategoryItemsData(),),
 //
 //          ],
 //        );
 //      },
 //    ),
 //  ),
 //   );


 // }