import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/component/images/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import '../../../../../../../core/routing/navigation_services.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../../../core/function/function.dart';
import '../../../../../../data/model/response/category_item_model.dart';
import '../../../../../../data/model/response/offers_model.dart';
import '../../../../../../domain/request_body/add_item_body.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/custom_add_cart_button.dart';
import '../../../../../component/custom_check_button.dart';
import '../../../../../component/custom_elevated_button.dart';
import '../../cart/cart_cubit.dart';
import '../home_cubit.dart';


class CustomProductItemWidget extends StatelessWidget {
  const CustomProductItemWidget({super.key, this.inHome, required this.offersModelData});
  final bool? inHome;
  final OffersModelData offersModelData;
  @override
  Widget build(BuildContext context) {
    CategoryItemsData categoryItemsData =CategoryItemsData(
      id: offersModelData.item!.id,
      name: offersModelData.item!.name,
      description: offersModelData.description,
      categoryId: offersModelData.item!.categoryId,
      categoryName: offersModelData.item!.categoryName,
      price: offersModelData.item!.price,
      priceDiscount: offersModelData.item!.priceDiscount,
      priceAfterDiscount: offersModelData.item!.priceAfterDiscount,
      storeId: offersModelData.restaurant!.id,
      image: offersModelData.item!.image,
      count: 1,
      inCart: offersModelData.item!.inCart,
      inFav: offersModelData.item!.inFav,
    );
    return InkWell(
      onTap: (){
        context.pushNamed(RoutesRestaurants.mealDetailsScreen,arguments: {
          'type':'details',
          'storeId':offersModelData.restaurant!.id!.toString(),'storeName':offersModelData.restaurant!.name!,'categoriesItemsModelData':categoryItemsData});
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.45,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow:  <BoxShadow>[
              BoxShadow(
                   color: inHome==false?Colors.black26: AppColors.whiteColor,
                  blurRadius: 1,
                  spreadRadius: 1)
            ]),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Container(
                    width: 167.w,
                    height: 131.h,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomImage(image: offersModelData.item!.image!,radius: 10,)
                ),
                Positioned(
                    bottom: 0.h,
                    left: 0.w,
                    child:Container(
                      width: 40.w,
                      decoration: const BoxDecoration(
                          color: AppColors.redColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(8))
                      ),child: Center(child:
                    Text('${offersModelData.item!.priceDiscount}%',style: TextStyles.font16Black600Weight.copyWith(
                        color: AppColors.whiteColor
                    ),
                    )),
                    )
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(8),
                  Text(
                    offersModelData.item!.name!,
                    style: TextStyles.font16Black600Weight,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        '${offersModelData.item!.priceAfterDiscount} ${LocaleKeys.lyd.tr()}',
                        style: TextStyles.font16Black600Weight.copyWith(
                          color:AppColors.textPink
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      horizontalSpace(10),
                      Text(
                        '${offersModelData.item!.price} ${LocaleKeys.lyd.tr()}',
                        style: TextStyles.font16Black600Weight.copyWith(
                          decoration: TextDecoration.lineThrough,
                            decorationThickness: 5,
                            decorationColor: Colors.grey.shade900,
                          color: Colors.grey.shade400
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  verticalSpace(5),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${LocaleKeys.from.tr()} ${ offersModelData.startDate} ${LocaleKeys.to.tr()} ${offersModelData.endDate}',
                      style: TextStyles.font16Black600Weight.copyWith(
                        fontSize: 12.sp,
                        color: Colors.grey.shade300
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Center(
                    child: CustomAddCartButton(
                      color: AppColors.buttonOrangeColor,
                      width: 200.w,
                      height: 30.h,
                      categoriesItemsModelData: categoryItemsData, storeName: 'offers',),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
