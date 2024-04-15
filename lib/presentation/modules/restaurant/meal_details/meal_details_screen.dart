import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/translations/locale_keys.dart';
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
import '../../../../core/function/function.dart';
import '../../../../data/model/response/category_item_model.dart';
import '../../../../domain/request_body/add_item_body.dart';
import '../../../component/custom_check_button.dart';
import '../../../component/custom_elevated_button.dart';
import '../../layout/screens/cart/cart_cubit.dart';

class MealDetailsScreen extends StatelessWidget {
  MealDetailsScreen({super.key, this.categoriesItemsModelData, required this.storeId});
  final CategoryItemsData? categoriesItemsModelData;
  final String storeId;

  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit=CartCubit.get(context);
    RestaurantCubit cubit = RestaurantCubit.get(context);
    cubit.getItemExtra(id: categoriesItemsModelData!.id!);

    return Scaffold(
      backgroundColor: const Color(0xffF1F2F6),
      body: Stack(
        fit:StackFit.expand ,
        children: [
          Stack(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: CustomImage(image: categoriesItemsModelData!.image!)),
              CustomTopBackWidget(),
              CustomTopFavWidget(),
              categoriesItemsModelData!.priceDiscount != null ?
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
                       CustomNamePriceWidget(name:  categoriesItemsModelData!.name!,priceDiscount: categoriesItemsModelData!.priceDiscount!=null?categoriesItemsModelData!.priceDiscount!:null,
                         price: categoriesItemsModelData!.price!=null?categoriesItemsModelData!.price.toString():null,
                         priceAfterDiscount: categoriesItemsModelData!.priceAfterDiscount!=null?categoriesItemsModelData!.priceAfterDiscount.toString():null,
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
                                   return Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       SizedBox(height: 5.h,),
                                       cubit.itemExtraModelDataList != null
                                           ? cubit.itemExtraModelDataList!
                                           .isNotEmpty
                                           ?  Padding(
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
                                             MultiSelectChip(
                                                 onSelectionChanged: (value){
                                                   cartCubit.extraIdList=value.map((e) => e!.id!.toString()).toList();
                                                 }, reportList: cubit.itemExtraModelDataList!.map((e) => e).toList(),
                                             )
                                           ],
                                         ),
                                       )
                                           : const SizedBox.shrink()
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
                                           )
                                     ],
                                   );
                                 },
                               ),
                               verticalSpace(10),
                               SizedBox(height: 15.h,),
                               Center(
                                 child: StatefulBuilder(builder: (context,setState){
                                   return Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       categoriesItemsModelData!.inCart==true?
                                       CustomCheckButton():
                                       Center(
                                         child: Padding(
                                           padding:
                                           const EdgeInsets.symmetric(horizontal: 10),
                                           child: CustomElevatedButton(
                                               borderRadius: 50,
                                               height: 40.h,
                                               width: 200.w,
                                               borderColor: AppColors.primaryColor,
                                               fontColor: Colors.white,
                                               onTap: () {
                                                 logInFirst(function: (){
                                                   AddItemBody addItemBody=
                                                   AddItemBody(itemId: categoriesItemsModelData!.id.toString(), qt: '1', storeId: storeId,
                                                       extraId: cartCubit.extraIdList
                                                   );
                                                   cartCubit.addItemCart(addItemBody: addItemBody, context: context).then((value){
                                                     setState((){
                                                       categoriesItemsModelData!.inCart=true;
                                                       RestaurantCubit cubit =RestaurantCubit.get(context);
                                                       cubit.getCategoryItems(categoryId:categoriesItemsModelData!.categoryId!, storeId:categoriesItemsModelData!.storeId!,notNull: true);
                                                     });
                                                   });
                                                 }, context: context);
                                               },
                                               buttonText: LocaleKeys.addCart.tr()),
                                         ),
                                       )
                                     ],
                                   );
                                 }),
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
      ),
    );
  }
}
