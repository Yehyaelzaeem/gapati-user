import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/translations/locale_keys.dart';
import 'package:cogina/domain/logger.dart';
import 'package:cogina/presentation/component/images/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/global/styles/colors.dart';
import '../../../../../../../core/global/styles/styles.dart';
import '../../../../../../data/model/response/cart_model.dart';
import '../../../../../../data/model/response/category_item_model.dart';
import '../../../../../../data/model/response/iitem_extra_model.dart';
import '../../../../../../domain/request_body/update_item_body.dart';
import '../../../../../component/custom_multi_select_chip.dart';
import '../cart_cubit.dart';


class CustomCartItem extends StatelessWidget {
    const CustomCartItem({super.key, this.hasShadow, this.height, this.hasDeleteIcon, this.product, this.imageWidth, this.chipRadius, this.chipHeight, required this.storeId});
  final bool? hasShadow;
  final double? height;
  final double? imageWidth;
  final double? chipRadius;
  final double? chipHeight;
  final bool? hasDeleteIcon;
  final String storeId;
   final CategoryItemsData? product;
  @override
  Widget build(BuildContext context) {
    CartCubit cubit =CartCubit.get(context);
    // List<ItemExtraModelData> listExtraData=[];
    // for(var a in product!.){
    //   listExtraData.add(ItemExtraModelData(
    //     id: a.id,
    //     name: a.name,
    //     price: a.price
    //   ));
    // }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height:product!.itemExtraModelDataList!=null? height?? 150.h:130.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow:
          hasShadow==true?
          [BoxShadow(color: AppColors.black.withOpacity(0.2),blurRadius: 5,
          // offset: const Offset(1,6)
          )]:null
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: imageWidth?? 140.w,
                height: double.infinity,
                child: CustomImage(image: product!.image!,radius: 20,)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10.w,),
                      Expanded(
                        child: Text(product!.name!.toString(),
                          style: TextStyles.font16Black600Weight,
                          maxLines: 2
                        ),
                      ),
                      const Icon(Icons.favorite_border_rounded,size: 20,),
                      SizedBox(width: 10.w,),
                    ],
                  ),
                  product!.itemExtraModelDataList!=null?
                  Padding(
                    padding:  EdgeInsets.only(right: 8.w),
                    child: StatefulBuilder(builder: (context,setState){
                      return Container(
                        height: chipHeight!=null?chipHeight!+20:60.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            MultiSelectChip(
                              height:chipHeight??45.h,
                              radius:chipRadius?? 12,
                              initialSelection:product!.itemExtraModelDataList!.map((e) => e).toList(),
                              onSelectionChanged: (value){
                                log('svalue', product!.itemExtraModelDataList!.length.toString());
                                setState((){
                                  product!.itemExtraModelDataList=value.map((e) => e).toList();
                                });

                                // List<String> list =value.map((e) => e.id.toString()).toList()
                                //     UpdateItemBody updateItem=UpdateItemBody(
                                //         itemId: item!.id.toString(), qt: '1', storeId: storeId.toString(),
                                //         extraId: value.map((e) => e.id.toString()).toList(),
                                //         itemCartId: item!.itemCartId!.toString());
                                // cubit.updateItemCart(updateItemBody: updateItem, context: context);
                              },
                              reportList: product!.itemExtraModelDataList!.map((e) => e).toList(),
                              paddingTop: 12,
                            ),
                          ],
                        ),
                      );
                    },)
                  ):
                  SizedBox.shrink(),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        horizontalSpace(10),
                        Text('${product!.priceAfterDiscount} ${LocaleKeys.lyd.tr()}',
                          style: TextStyles.font16Black600Weight.copyWith(
                              color: AppColors.redColor.withOpacity(0.8)
                          ),
                        ),
                        horizontalSpace(10),
                        Row(
                          children: [
                            InkWell(
                              child: const CircleAvatar(
                                backgroundColor: AppColors.backGroundPink2,
                                radius: 13,
                                child: Icon(Icons.remove,color: AppColors.backGroundPink3,weight: 5,size: 20,),
                              ),
                              onTap: (){
                                cubit.removeQty(product!);
                                // cubit.subQtCart(itemId: item!.id.toString(), context: context);
                              },
                            ),
                            SizedBox(width: 10.w,),
                            CircleAvatar(
                              backgroundColor: AppColors.sandwichBackGround,
                              radius: 13,
                              child: Text('${product!.count!}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13
                              ),
                              ),
                            ),
                            SizedBox(width: 10.w,),
                            InkWell(
                              child: const CircleAvatar(
                                backgroundColor: AppColors.sandwichBackGround,
                                radius: 13,
                                child: Icon(Icons.add,color: AppColors.primaryColor,weight: 5,size: 20,),
                              ),
                              onTap: (){
                                cubit.addQty(product!);

                                // cubit.addQtCart(itemId: item!.id.toString(), context: context);

                              },
                            ),
                          ],
                        ),
                        horizontalSpace(10),
                        hasDeleteIcon!=false? InkWell(
                            onTap: (){
                              cubit.removeProduct(product!);
                              // cubit.deleteItemCart(itemId:  item!.id.toString(), context: context);
                            },
                            child: const Icon(Icons.delete_outline,size: 20,)):const SizedBox.shrink(),
                        horizontalSpace(10),
                      ],
                    ),
                  ),
                  verticalSpace(1)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
