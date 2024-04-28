import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/component/images/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cogina/core/global/styles/colors.dart';

import '../../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/translations/locale_keys.dart';
import '../../../../../../data/model/response/favorite_model.dart';
import '../favorite_cubit.dart';



class CustomFavoriteItem extends StatelessWidget {
   CustomFavoriteItem({super.key,  required this.favoriteModelData});
   final FavoriteModelData favoriteModelData;
  @override
  Widget build(BuildContext context) {
    FavoriteCubit favoriteCubit =FavoriteCubit.get(context);
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.customGray.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 130.h,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                  child: CustomImage(image: favoriteModelData.image!),
                ),
              ),
              Positioned(
              top: 8.h,
              left:context.locale.languageCode==Locale('en').toString()? null:5.w,
              right:context.locale.languageCode==Locale('en').toString()? 5.w:null,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.whiteColor.withOpacity(0.9),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 7,
                              offset: Offset(1, 5))
                        ]),
                    child:
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(onTap: (){
                        setState(() {
                          if(favoriteModelData.inFav==false){
                            favoriteCubit.addFavorite(itemId: favoriteModelData.id!, context: context,);
                            favoriteModelData.inFav=true;
                          }else{
                            favoriteCubit.removeFavorite(itemId: favoriteModelData.id!, context: context);
                            favoriteModelData.inFav=false;
                          }
                        });
                      }, child:favoriteModelData.inFav==true? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_rounded,color: Colors.grey,)),
                    ),

                  );
                },
              )),
            ],
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    favoriteModelData.name!,
                    style: TextStyles.font16Black600Weight.copyWith(
                      height: 1,
                      fontSize: 14.sp
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                      favoriteModelData.description!,
                    style: TextStyles.font16Black600Weight.copyWith(
                        fontSize: 12.sp,
                        height: 1,
                        color: Colors.grey.shade300
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        '${favoriteModelData.priceAfterDiscount} ${LocaleKeys.lyd.tr()}',
                        style: TextStyles.font16Black600Weight.copyWith(
                            height: 1,
                            fontSize: 12.sp,
                            color:AppColors.textPink
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      horizontalSpace(10),
                      Text(
                        '${favoriteModelData.price} ${LocaleKeys.lyd.tr()}',
                        style: TextStyles.font16Black600Weight.copyWith(
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2,
                            height: 1,
                            fontSize: 12.sp,
                            decorationColor: Colors.grey.shade400,
                            color: Colors.grey.shade400
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  verticalSpace(5),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
