import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/helpers/spacing.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import 'package:cogina/presentation/component/custom_multi_select_chip.dart';
import 'package:cogina/presentation/component/images/custom_image.dart';
import 'package:cogina/presentation/modules/restaurant/meal_details/widget/custom_name_price_widget.dart';
import 'package:cogina/presentation/modules/restaurant/meal_details/widget/custom_offer_widget.dart';
import 'package:cogina/presentation/modules/restaurant/meal_details/widget/custom_shimmer_chip.dart';
import 'package:cogina/presentation/modules/restaurant/meal_details/widget/custom_top_back_widget.dart';
import 'package:cogina/presentation/modules/restaurant/meal_details/widget/custom_top_fav_widget.dart';
import 'package:cogina/presentation/modules/restaurant/restaurant_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../data/model/response/category_item_model.dart';
import '../../../../data/model/response/item_extra_model.dart';
import '../../../component/custom_add_cart_button.dart';
import '../../layout/screens/cart/cart_cubit.dart';

class MealDetailsScreen extends StatelessWidget {
  MealDetailsScreen({super.key, this.categoriesItemsModelData, required this.storeId, required this.storeName, required this.type, this.count, this.itemExtraList});
  final CategoryItemsData? categoriesItemsModelData;
  final String storeId;
  final String type;
  final String storeName;
  final int? count;
  final List<ItemExtraModelData>? itemExtraList;


  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit=CartCubit.get(context);
    RestaurantCubit cubit = RestaurantCubit.get(context);
    cubit.getItemExtra(id: categoriesItemsModelData!.id!,).then((value) {
    });
    return WillPopScope(
      onWillPop: () {
        cartCubit.updateData();
         context.pop();
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF1F2F6),
        body: BlocBuilder<CartCubit, CartState>(
                // listener: (context, state) {},
                builder: (context, state) {
                  return Stack(
                      fit:StackFit.expand ,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.4,
                                child: CustomImage(image:categoriesItemsModelData!.image!)),
                            CustomTopBackWidget(type: type,),
                            CustomTopFavWidget(categoryItemsData: categoriesItemsModelData!,),
                            categoriesItemsModelData!.priceDiscount != null && categoriesItemsModelData!.priceDiscount !='0' ?
                            CustomOfferWidget(priceDiscount: categoriesItemsModelData!.priceDiscount!,):
                            const SizedBox.shrink()
                          ],
                        ),
                        Positioned(
                         top: MediaQuery.of(context).size.height * 0.35,
                         left: 0,
                         right: 0,
                         child:  SingleChildScrollView(
                           child: Column(
                           children: [
                             Container(
                                 decoration: BoxDecoration(
                                     color: AppColors.whiteColor,
                                     borderRadius: BorderRadius.circular(20)),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     CustomNamePriceWidget(name:  categoriesItemsModelData!.name!,priceDiscount:categoriesItemsModelData!.priceDiscount!=null?categoriesItemsModelData!.priceDiscount!:null,
                                       price:categoriesItemsModelData!.price!=null?categoriesItemsModelData!.price.toString():null,
                                       priceAfterDiscount:categoriesItemsModelData!.priceAfterDiscount!=null?categoriesItemsModelData!.priceAfterDiscount.toString():null,
                                     ),
                                     SizedBox(height: 10.h,),
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(20),
                                         color: const Color(0xffF1F2F6),),
                                       width: double.infinity,
                                       child: Padding(
                                         padding: EdgeInsets.symmetric(
                                             horizontal: 10.w, vertical: 16.h),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             verticalSpace(10),
                                             Text(
                                               LocaleKeys.description.tr(),
                                               style: TextStyles.font18Black700Weight.copyWith(
                                                   fontWeight: FontWeight.bold,
                                                   color: AppColors.black),
                                             ),
                                             Text(
                                               '${categoriesItemsModelData!.description}',
                                               style: TextStyles.font18Black700Weight.copyWith(
                                                   fontWeight: FontWeight.w400,
                                                   fontSize: 14,
                                                   color: AppColors.customBlack),
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
                                                           vertical: 10,
                                                           horizontal: 10),
                                                       child: Column(
                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                                         children: [
                                                           Text(
                                                             LocaleKeys.extraComponents.tr(),
                                                             style: TextStyles.font18Black700Weight.copyWith(
                                                                 fontWeight: FontWeight.bold,
                                                                 color: AppColors.black),
                                                           ),
                                                           verticalSpace(10),
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



                                                             // categoriesItemsModelData!.itemExtraModelDataList!=cubit.itemExtraModelDataList;
                                                             // List<ItemExtraModelData> initialSelection = categoriesItemsModelData!.itemExtraModelMain!
                                                             //     .where((element) =>
                                                             //     cartCubit.products.any((product) =>
                                                             //     product.id==categoriesItemsModelData!.id! &&
                                                             //     product.itemExtraModelDataList != null &&
                                                             //         // product.itemExtraModelDataList==categoriesItemsModelData!.itemExtraModelDataList!&&
                                                             //         product.itemExtraModelDataList!.any((itemExtra) =>
                                                             //         itemExtra.id == element.id))).toList();
                                                             // CategoryItemsData lastProducts =cartCubit.products.lastWhere((element) => element.id==categoriesItemsModelData!.id!);
                                                             // List<ItemExtraModelData>  initialSelection = cubit.itemExtraModelDataList!
                                                             //     .where((element) =>lastProducts.itemExtraModelDataList!.any((itemExtra) => itemExtra.id == element.id)
                                                             // ).toList();
                                                             return Column(
                                                               children: [
                                                                 MultiSelectChip(
                                                                   onSelectionChanged: (value){
                                                                     categoriesItemsModelData!.itemExtraModelDataSelected = value.map((e) => e).toList();
                                                                     // log('value d', value.map((e) => e.toJson()).toList().toString());
                                                                     if(type=='cart'){
                                                                       if (cartCubit.products.where((CategoryItemsData element) => element.id == categoriesItemsModelData!.id ).toList().length > 0){
                                                                         cartCubit.updateExtra(categoriesItemsModelData!, value.map((e) => e).toList());
                                                                       }
                                                                     }
                                                                   },
                                                                   reportList: cubit.itemExtraModelDataList!,
                                                                   initialSelection:
                                                                   type=='cart'?
                                                                    cubit.itemExtraModelDataList?.where((item) =>
                                                                    itemExtraList?.any((element) => element.id == item.id) ?? false).toList() :initialSelection

                                                                 ),

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
                                             Center(
                                               child: CustomAddCartButton(
                                                 type: type,
                                                 width: 200.w,
                                                 categoriesItemsModelData:  categoriesItemsModelData!, storeName: storeName,),
                                             )
                                           ],
                                         ),
                                       ),
                                     ),
                                   ],
                                 )),
                           ],
                           ),
                         ),)
                      ],
                    );
                },
              ),
      ),
    );
  }
}
