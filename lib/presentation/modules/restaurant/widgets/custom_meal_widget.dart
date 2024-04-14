import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/helpers/toast_states/enums.dart';
import 'package:cogina/core/translations/locale_keys.dart';
import 'package:cogina/presentation/component/images/custom_image.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/cart_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../core/function/function.dart';
import '../../../../data/model/response/category_item_model.dart';
import '../../../../domain/request_body/add_item_body.dart';
import '../../../component/custom_check_button.dart';
import '../restaurant_cubit.dart';

class CustomMealWidget extends StatefulWidget {
  const CustomMealWidget({super.key,  this.categoriesItemsModelData, required this.storeId});
  final CategoryItemsData? categoriesItemsModelData;
  final String storeId;

  @override
  State<CustomMealWidget> createState() => _CustomMealWidgetState();
}

class _CustomMealWidgetState extends State<CustomMealWidget> {
  @override
  Widget build(BuildContext context) {
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
            SizedBox(width: 5.w,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 1.h,),
                   Column(
                     children: [
                       Text(widget.categoriesItemsModelData!.name!,
                         style: TextStyles.font16Black600Weight,
                       ),
                       Text(widget.categoriesItemsModelData!.description!,
                         style: TextStyles.font15CustomGray400Weight.copyWith(
                             fontSize: 13
                         ),
                         textAlign: TextAlign.center,
                         maxLines: 3,
                         overflow: TextOverflow.ellipsis,
                       ),
                     ],
                   ),
                  widget.categoriesItemsModelData!.inCart==false?
                  FittedBox(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            logInFirst(function: (){
                              AddItemBody addItemBody=
                              AddItemBody(itemId: widget.categoriesItemsModelData!.id.toString(), qt: '1', storeId: widget.storeId);
                              CartCubit.get(context).addItemCart(addItemBody: addItemBody, context: context).then((value) {
                                setState(() {
                                  RestaurantCubit cubit =RestaurantCubit.get(context);
                                  cubit.getCategoryItems(categoryId:widget.categoriesItemsModelData!.categoryId!, storeId:widget.categoriesItemsModelData!.storeId!,notNull: true);
                                });
                              });
                            },
                                context: context);
                             },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            minimumSize: const Size(20, 30), // Set your desired width and height
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.shopping_cart_checkout_sharp, color: Colors.white, size: 12),
                              horizontalSpace(2),
                              Text(
                                LocaleKeys.addCart.tr(),
                                style: TextStyles.font14White500Weight.copyWith(fontSize: 12),
                              )
                            ],
                          ),
                        )),
                  ):
                  CustomCheckButton(),
                ],
              ),
            ),
            SizedBox(width: 5.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10.h,),
                const Icon(Icons.favorite,color: Colors.red,),
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
