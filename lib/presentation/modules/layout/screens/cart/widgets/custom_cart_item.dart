import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/translations/locale_keys.dart';
import 'package:cogina/presentation/component/images/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/global/styles/colors.dart';
import '../../../../../../../core/global/styles/styles.dart';
import '../../../../../../data/model/response/cart_model.dart';
import '../../../../../../data/model/response/iitem_extra_model.dart';
import '../../../../../component/custom_multi_select_chip.dart';
import '../cart_cubit.dart';


class CustomCartItem extends StatelessWidget {
    const CustomCartItem({super.key, this.hasShadow, this.height, this.hasDeleteIcon, this.item, this.imageWidth, this.chipRadius, this.chipHeight});
  final bool? hasShadow;
  final double? height;
  final double? imageWidth;
  final double? chipRadius;
  final double? chipHeight;
  final bool? hasDeleteIcon;
   final Items? item;
  @override
  Widget build(BuildContext context) {
    CartCubit cubit =CartCubit.get(context);
    List<ItemExtraModelData> listExtraData=[];
    for(var a in item!.extra!.data!){
      listExtraData.add(ItemExtraModelData(
        id: a.id,
        name: a.name,
        price: a.price
      ));
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height:listExtraData.isNotEmpty? height?? 150.h:130.h,
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
                child: CustomImage(image: item!.image!,radius: 20,)),
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
                        child: Text(item!.name!,
                          style: TextStyles.font16Black600Weight,
                          maxLines: 2
                        ),
                      ),
                      const Icon(Icons.favorite_border_rounded,size: 20,),
                      SizedBox(width: 10.w,),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: 8.w),
                    child: Container(
                      height: chipHeight!=null?chipHeight!+20:60.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          MultiSelectChip(
                            height:chipHeight??45.h,
                               radius:chipRadius?? 12,
                               initialSelection:listExtraData.map((e) => e).toList(),
                               onSelectionChanged: (value){
                                 // cartCubit.extraIdList=value.map((e) => e!.id!.toString()).toList();
                               },
                               reportList: listExtraData.map((e) => e).toList(),
                              paddingTop: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        horizontalSpace(10),
                        Text('${item!.price} ${LocaleKeys.lyd.tr()}',
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
                                cubit.subQtCart(itemId: item!.id.toString(), context: context);
                              },
                            ),
                            SizedBox(width: 10.w,),
                            CircleAvatar(
                              backgroundColor: AppColors.sandwichBackGround,
                              radius: 13,
                              child: Text('${item!.qty!}',
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
                                cubit.addQtCart(itemId: item!.id.toString(), context: context);

                              },
                            ),
                          ],
                        ),
                        horizontalSpace(10),
                        hasDeleteIcon!=false? InkWell(
                            onTap: (){
                              cubit.deleteItemCart(itemId:  item!.id.toString(), context: context);
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
