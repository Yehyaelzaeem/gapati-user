
import '../../../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../core/function/function.dart';
import '../../../../data/model/response/category_item_model.dart';
import '../../../component/custom_add_cart_button.dart';
import '../../../component/images/custom_image.dart';
import '../../layout/screens/cart/cart_cubit.dart';
import '../../layout/screens/favorite/favorite_cubit.dart';
import '../../layout/screens/home/meal/meal_details/meal_details_screen.dart';

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
     InkWell(
       onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>
             MealDetailsScreen(
               categoriesItemsModelData: widget.categoriesItemsModelData!,
               storeId: '1', storeName: widget.storeName, type: widget.storeName, count: 0,)));

       },
       child:  Padding(
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
                         }, context: context, screenName: 'favoriteDetails');
                       },
                       icon:widget.categoriesItemsModelData!.inFav==true? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_rounded,color: Colors.grey,)),
                   SizedBox(height: 5.h,),
                   SizedBox(
                     width: 50.w,
                     child: FittedBox(
                       child: Column(
                         children: [
                           widget.categoriesItemsModelData!.priceDiscount!=null&& widget.categoriesItemsModelData!.priceDiscount! !="0"?
                           Text(

                             '${double.parse(widget.categoriesItemsModelData!.price!=null?widget.categoriesItemsModelData!.price.toString():((widget.categoriesItemsModelData?.productSize?.data?.isNotEmpty??false)? (widget.categoriesItemsModelData?.productSize?.data?[0].price.toString()??'0'):'0' ),).toStringAsFixed(1)} ${LocaleKeys.lyd.tr()}',
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
                             '${double.parse((widget.categoriesItemsModelData!.priceAfterDiscount!=null && widget.categoriesItemsModelData!.priceAfterDiscount!.toString() !='0')?widget.categoriesItemsModelData!.priceAfterDiscount.toString():((widget.categoriesItemsModelData?.productSize?.data?.isNotEmpty??false)? (widget.categoriesItemsModelData?.productSize?.data?[0].priceAfterDiscount.toString()??'0'):'0' ),).toStringAsFixed(1)} ${LocaleKeys.lyd.tr()}',
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
       ),
     );
  }
}
