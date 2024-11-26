import 'package:delivego/generated/locale_keys.g.dart';
import 'package:delivego/presentation/component/images/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/function/function.dart';
import '../../../../../../core/global/fonts/app_fonts.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/color.dart';
import '../../../../../../data/model/response/category_item_model.dart';
import '../../../../../../data/model/response/home_params.dart';
import '../../../../../component/custom_add_cart_button.dart';
import '../../../../../component/texts/black_texts.dart';
import '../../../../../component/texts/hint_texts.dart';
import '../../favorite/favorite_cubit.dart';
import '../../more/address/address_cubit.dart';
import '../home_cubit.dart';
import '../meal/meal_details/meal_details_screen.dart';

class HomeOffersWidget extends StatelessWidget {
  const HomeOffersWidget({Key? key,}) : super(key: key);

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
                  ...cubit.offerList
                      ?.map((e) => InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          MealDetailsScreen(categoriesItemsModelData:
                          CategoryItemsData(id: e.item?.id??0, name: e.item?.name, image: e.item?.image??'',
                            priceAfterDiscount: e.item?.priceAfterDiscount,
                            priceDiscount: e.item?.priceAfterDiscount,
                            price: e.item?.price, storeId: 1,  count: 0,),
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
                                image: e.item?.image ?? '',
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
                                        if(e.item?.inFav==false){
                                          favoriteCubit.addFavorite(itemId: e.item?.id??0, context: context,);
                                          e.item?.inFav=true;
                                        }else{
                                          favoriteCubit.removeFavorite(itemId: e.item?.id??0, context: context);
                                          e.item?.inFav=false;
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
                                            if(e.item?.inFav==false){
                                              favoriteCubit.addFavorite(itemId: e.item?.id??0, context: context,);
                                              e.item?.inFav=true;
                                            }else{
                                              favoriteCubit.removeFavorite(itemId: e.item?.id??0, context: context);
                                              e.item?.inFav=false;
                                            }
                                          });
                                        },
                                            context: context, screenName: 'favoriteDetails');
                                      },
                                      child:
                                          e.item?.inFav==true?Icon(Icons.favorite, color: Colors.red,size: 20,):Icon(Icons.favorite_border, color: Colors.grey,size: 20,),
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
                                     Row(
                                       children: [
                                         BlackBoldText(
                                           label: e.item?.name ?? '',
                                           fontSize: 12.sp,
                                         ),
                                         horizontalSpace(10),
                                         Row(
                                           children: [
                                             Icon(Icons.star, color: Colors.yellow,size: 20,),
                                             HintSemiBoldText(
                                               label: '(85) 4.5',
                                               fontSize: 12.sp,
                                             ),

                                           ],
                                         ),
                                       ],
                                     ),
                                     Row(
                                       children: [
                                         BlackBoldText(
                                           label: '  ${e.item?.priceAfterDiscount ?? ''} ${LocaleKeys.lyd.tr()}',
                                           fontSize: 12.sp,

                                         ),
                                         horizontalSpace(5),
                                         HintSemiBoldText(
                                           label: '${e.item?.price ?? ''} ${LocaleKeys.lyd.tr()}',
                                           fontSize: 12.sp,
                                           style: TextStyle(color: Colors.grey.shade400,fontWeight: FontWeight.w700,
                                               fontFamily: AppFonts.cairo,
                                               fontSize: 12.sp,decorationColor: Colors.grey.shade400,
                                               decoration: TextDecoration.lineThrough),
                                         ),
                                         Spacer(),
                                         Container(
                                           padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h)+ EdgeInsets.only(top: 0.h),
                                           decoration: BoxDecoration(
                                             color: primaryColor.withOpacity(0.2),
                                             borderRadius: BorderRadius.circular(30),
                                           ),
                                           child:   BlackMediumText(
                                             labelColor: primaryColor.withOpacity(0.7),
                                             label: '%${e.item?.priceDiscount ?? ''} ${'OFF'}',
                                             fontSize: 12.sp,
                                           ),
                                         )
                                       ],
                                     ),
                                     Row(
                                       children: [
                                         HintSemiBoldText(
                                           label: '${e.item?.categoryName??''}',
                                           fontSize: 12.sp,
                                         ),

                                         Spacer(),
                                         Container(
                                             margin: EdgeInsets.only(top: 2.h),
                                             padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h)+ EdgeInsets.only(top: 0.h),
                                             decoration: BoxDecoration(
                                               color: Colors.blue.withOpacity(0.2),
                                               borderRadius: BorderRadius.circular(30),
                                             ),
                                             child:   Row(
                                               crossAxisAlignment: CrossAxisAlignment.end,
                                               mainAxisAlignment: MainAxisAlignment.end,
                                               children: [
                                                 Icon(Icons.timelapse, color: Colors.black.withOpacity(0.7),size: 15,),
                                                 horizontalSpace(5),
                                                 BlackMediumText(

                                                   labelColor: Colors.black.withOpacity(0.7),
                                                   label: '30 دقيقة',
                                                   fontSize: 12.sp,
                                                 ),
                                               ],
                                             )
                                         )
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
                                id: e.item?.id??0, name: e.item?.name,
                                branchId: 1,
                                image: e.item?.image??'',
                                priceAfterDiscount: e.item?.priceAfterDiscount,
                                priceDiscount: e.item?.priceAfterDiscount,
                                price: e.item?.price, storeId: 1,  count: 0,), storeName: 'offers',),
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
