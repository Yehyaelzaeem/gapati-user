import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/function/function.dart';
import '../../../../../../core/global/fonts/app_fonts.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/color.dart';
import '../../../../../../data/model/response/category_item_model.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/custom_add_cart_button.dart';
import '../../../../../component/images/custom_image.dart';
import '../../../../../component/texts/black_texts.dart';
import '../../../../../component/texts/hint_texts.dart';
import '../../favorite/favorite_cubit.dart';
import '../home_cubit.dart';
import '../meal/meal_details/meal_details_screen.dart';

class BestDishMealsWidget extends StatelessWidget {
  const BestDishMealsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);

    return
      BlocConsumer<HomeCubit, HomeState>(
          builder: (context,state){
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...cubit.bestDishModel?.data
                      ?.map((e) => InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          MealDetailsScreen(categoriesItemsModelData:
                          CategoryItemsData(
                            id:
                            e.id??0,
                            name: e.name??'',
                            description: e.description??'',
                            categoryId: e.categoryId??0,
                            categoryName: e.categoryName??'',
                            price:e.price??0,
                            priceDiscount: e.priceDiscount??0,
                            priceAfterDiscount: e.priceAfterDiscount??0,
                            storeId:e.storeId??0,
                            image: e.image??'',
                            inCart: e.incart??false,
                            inFav: e.inFav??false,
                          ),
                            storeId: '1', storeName: 'Gapati', type: 'details', count: 0,)));
                    },
                    child:
                    Container(
                        width: 272.w,
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 2,
                                // offset: Offset(4, 5),
                              )
                            ]
                        ),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                CustomImageOnlyRadius(
                                  width: 272.w,
                                  height: 161.h,
                                  image: e.image ?? '',
                                  fit: BoxFit.fill,
                                  topRightRadius: 12,
                                  topLeftRadius: 12,
                                ),
                                // Container(
                                //   width: 250.w,
                                //   height: 135.h,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(12),
                                //     gradient: LinearGradient(
                                //       begin: Alignment.bottomCenter,
                                //       end: Alignment.topCenter,
                                //       colors: [
                                //         Colors.black.withOpacity(0.8),
                                //         Colors.black.withOpacity(0.4),
                                //         Colors.black.withOpacity(0.1),
                                //       ],
                                //     ),
                                //   ),
                                //   child: SizedBox(),
                                // ),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child:
                                    Container(
                                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8),
                                              topRight: Radius.circular(8),
                                            )
                                        ),
                                        child:  Row(
                                          children: [
                                            Image.asset(AppImages.discount),
                                            BlackMediumText(
                                              labelColor:Color(0xffFFA5A6),
                                              label: e.name ?? "",
                                              fontSize: 12.sp,

                                            ),
                                          ],
                                        )
                                    )),
                                Positioned(
                                    top: 5,
                                    left: 10,
                                    child:
                                    StatefulBuilder(builder: (context,setState){
                                      return  InkWell(
                                        onTap: (){
                                          logInFirst(function: (){
                                            FavoriteCubit favoriteCubit =FavoriteCubit.get(context);
                                            setState(() {
                                              if(e.inFav==false){
                                                favoriteCubit.addFavorite(itemId: e.id??0, context: context,);
                                                e.inFav=true;
                                              }else{
                                                favoriteCubit.removeFavorite(itemId: e.id??0, context: context);
                                                e.inFav=false;
                                              }
                                            });
                                          }, context: context, screenName: 'favoriteDetails');
                                        },
                                        child:  Container(
                                          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                          child:
                                          InkWell(
                                            onTap: (){
                                              logInFirst(function: (){
                                                FavoriteCubit favoriteCubit =FavoriteCubit.get(context);
                                                setState(() {
                                                  if(e.inFav==false){
                                                    favoriteCubit.addFavorite(itemId: e.id??0, context: context,);
                                                    e.inFav=true;
                                                  }else{
                                                    favoriteCubit.removeFavorite(itemId: e.id??0, context: context);
                                                    e.inFav=false;
                                                  }
                                                });
                                              },
                                                  context: context, screenName: 'favoriteDetails');
                                            },
                                            child:
                                            e.inFav==true?Icon(Icons.favorite, color: Colors.red,size: 20,):Icon(Icons.favorite_border, color: Colors.grey,size: 20,),
                                          ),
                                        ),
                                      );
                                    },)
                                )
                              ],
                            ),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpace(8),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: Image.asset(AppImages.logo, width: 30.w, height: 30.w,),
                                        ),
                                        horizontalSpace(10),
                                        Expanded(child:
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ReadMoreText(
                                              ' ${e.description ?? ''}',
                                              trimMode: TrimMode.Line,
                                              trimLines: 1,
                                              trimCollapsedText: 'Show More',
                                              moreStyle: TextStyles.font21Black700Weight.copyWith(fontSize: 10, color: Colors.blue,inherit: true,decoration: TextDecoration.underline,fontWeight: FontWeight.w500),
                                              lessStyle: TextStyles.font21Black700Weight.copyWith(fontSize: 10, color: Colors.blue,inherit: true,decoration: TextDecoration.underline,fontWeight: FontWeight.w500),
                                              trimExpandedText: 'Show Less',
                                              style: TextStyles.font21Black700Weight.copyWith(fontSize: 14, color: Colors.black,inherit: true,),
                                              textAlign:TextAlign.start,
                                              // moreStyle: blackRegularStyle.copyWith(fontSize: 12, color: Colors.black,inherit: true),
                                            ),
                                            // BlackBoldText(
                                            //   label: e.description ?? '',
                                            //   fontSize: 12.sp,
                                            // ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                BlackBoldText(
                                                  label: '  ${e.priceAfterDiscount ?? ''} ${LocaleKeys.lyd.tr()}',
                                                  fontSize: 12.sp,

                                                ),
                                                horizontalSpace(5),
                                                if(e.priceDiscount!=null && e.priceDiscount!=0 && e.priceDiscount !='0')
                                                HintSemiBoldText(
                                                  label: '${e.price ?? ''} ${LocaleKeys.lyd.tr()}',
                                                  fontSize: 12.sp,
                                                  style: TextStyle(color: Colors.grey.shade400,fontWeight: FontWeight.w700,
                                                      fontFamily: AppFonts.cairo,
                                                      fontSize: 12.sp,decorationColor: Colors.grey.shade400,
                                                      decoration: TextDecoration.lineThrough),
                                                ),

                                              ],
                                            ),

                                          ],
                                        )
                                        )
                                      ],
                                    ),
                                  ]
                              ),
                            ),
                            verticalSpace(4),
                            Center(
                              child: CustomAddCartButton(
                                color: AppColors.buttonOrangeColor,
                                width: 200.w,
                                height: 30.h,
                                categoriesItemsModelData:CategoryItemsData(
                                  id: e.id??0, name: e.name,
                                  branchId: 1,
                                  image: e.image??'',
                                  priceAfterDiscount: e.priceAfterDiscount,
                                  priceDiscount: e.priceAfterDiscount,
                                  price: e.price, storeId: 1,  count: 0,), storeName: 'offers',),
                            ),
                            verticalSpace(5),
                          ],
                        )
                    ),
                  ))
                      .toList() ??
                      [],
                ],
              ),
            );
          },
          listener: (context, state) {});
  }
}
