import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/helpers/toast_states/enums.dart';
import 'package:cogina/core/translations/locale_keys.dart';
import 'package:cogina/domain/logger.dart';
import 'package:cogina/presentation/component/images/custom_image.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/cart_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../core/function/function.dart';
import '../../../../data/model/response/category_item_model.dart';
import '../../../../domain/request_body/add_item_body.dart';
import '../../../component/custom_add_cart_button.dart';
import '../../../component/custom_check_button.dart';
import '../../layout/screens/favorite/favorite_cubit.dart';
import '../restaurant_cubit.dart';

class CustomMealWidget extends StatefulWidget {
  const CustomMealWidget({super.key,  this.categoriesItemsModelData, required this.storeName});
  final CategoryItemsData? categoriesItemsModelData;
  final String storeName;

  @override
  State<CustomMealWidget> createState() => _CustomMealWidgetState();
}

class _CustomMealWidgetState extends State<CustomMealWidget> {
  @override
  Widget build(BuildContext context) {
    CartCubit cubit= CartCubit.get(context);
    FavoriteCubit favoriteCubit =FavoriteCubit.get(context);
    return
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 130.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black26,blurRadius: 3)]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 140.w,
                height: double.infinity,
                child: CustomImage(image: widget.categoriesItemsModelData!.image!,radius: 20,)),
            SizedBox(width: 8.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   Flexible(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SizedBox(height: 10.h,),
                         Text(widget.categoriesItemsModelData!.name!,
                           style: TextStyles.font16Black600Weight,
                           maxLines: 1,
                           overflow: TextOverflow.ellipsis,
                         ),
                         Flexible(
                           child: Text(widget.categoriesItemsModelData!.description!,
                             style: TextStyles.font15CustomGray400Weight.copyWith(
                                 fontSize: 13,
                               height: 1.2
                             ),
                             // textAlign: TextAlign.center,
                             maxLines: 3,
                             overflow: TextOverflow.ellipsis,
                           ),
                         ),
                       ],
                     ),
                   ),
                  FittedBox(
                    child: CustomAddCartButton(
                      height: 30.h,
                      categoriesItemsModelData:  widget.categoriesItemsModelData!, storeName: widget.storeName,),
                  )
                ],
              ),
            ),
            SizedBox(width: 5.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10.h,),
                IconButton(
                    onPressed: (){
                      logInFirst(function: (){
                        setState(() {
                          if(widget.categoriesItemsModelData!.inFav==false){
                            favoriteCubit.addFavorite(itemId: widget.categoriesItemsModelData!.id!, context: context);
                            widget.categoriesItemsModelData!.inFav=true;
                          }else{
                            favoriteCubit.removeFavorite(itemId: widget.categoriesItemsModelData!.id!, context: context);
                            widget.categoriesItemsModelData!.inFav=false;
                          }
                        });
                      }, context: context);
                },
                    icon:widget.categoriesItemsModelData!.inFav==true? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_rounded,color: Colors.grey,)),
                SizedBox(height: 5.h,),
               SizedBox(
                 width: 50.w,
                 child: FittedBox(
                   child: Column(
                     children: [
                       widget.categoriesItemsModelData!.priceDiscount!=null?
                       Text(
                         '${double.parse(widget.categoriesItemsModelData!.price!.toString()).toStringAsFixed(1)} ${LocaleKeys.lyd.tr()}',
                         style: TextStyles.font16Black600Weight.copyWith(
                             decorationColor: AppColors.blackColor,
                             decorationThickness: 2,
                             decoration: TextDecoration.lineThrough,
                             fontSize: 14,
                             fontWeight: FontWeight.w400
                         ),
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                       ):const SizedBox.shrink(),
                       Text(
                           '${double.parse(widget.categoriesItemsModelData!.priceAfterDiscount!.toString()).toStringAsFixed(1)} ${LocaleKeys.lyd.tr()}',
                         style: TextStyles.font16Black600Weight.copyWith(
                             color:AppColors.redColor
                         ),
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                       ),
                     ],
                   ),
                 ),
               ),
                SizedBox(height: 10.h,),
              ],
            ),
            SizedBox(width: 10.w,),
          ],
        ),
      ),
    );
  }
}
