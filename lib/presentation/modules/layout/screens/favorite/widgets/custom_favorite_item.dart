import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cogina/core/global/styles/colors.dart';

import '../../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/translations/locale_keys.dart';



class CustomFavoriteItem extends StatelessWidget {
   CustomFavoriteItem({super.key, this.isOffer});
  bool isFav =true;
  final bool? isOffer;
  @override
  Widget build(BuildContext context) {
    isOffer==true?isFav=false:null;
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
          verticalSpace(10),
          Expanded(
            child: Center(
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)
                      ),
                      child:
                      Image.asset(
                          isOffer==true?
                          RestaurantImages.pro2:RestaurantImages.bur1)
                  ),
                  Positioned(
                    top: 8.h,
                    right: 1.w,
                    child:
                    StatefulBuilder(builder: (BuildContext context,void Function(void Function()) setState){
                      return
                        isFav==true?
                        InkWell(
                          onTap: (){
                            setState(() {
                              isFav=false;
                            });
                          },
                          child: CircleAvatar(
                              minRadius: 15.sp,
                              backgroundColor: Colors.pink.shade50,
                              child:
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 20.sp,
                              )
                          ),
                        ):
                        InkWell(
                          onTap: (){
                            setState(() {
                              isFav=true;
                            });
                          },
                          child: CircleAvatar(
                            minRadius: 12.sp,
                            backgroundColor:  AppColors.whiteColor,
                            child:
                            Icon(
                              Icons.favorite_border_rounded,
                              color: Colors.grey,
                              size: 15.sp,
                            ),
                          ),
                        ) ;


                    }),
                  ),
                  isOffer==true?
                  Positioned(
                    bottom: 0.h,
                    left: 0.w,
                    child:Container(
                      width: 40.w,
                      decoration: const BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(8))
                      ),child: Center(child: Text('30%',style: TextStyles.font16Black600Weight.copyWith(
                      color: AppColors.whiteColor
                    ),
                    )),
                    )
                  ):const SizedBox.shrink(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                verticalSpace(1),
                verticalSpace(1),
                Center(
                  child:
                  Text(
                    isOffer==true?
                    'Triple Cheeseburger':'Double McPlant',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isOffer==true? Text(
                        '60.0 ${LocaleKeys.lyd.tr()}',
                        style: TextStyle(
                          fontSize: 11.sp,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold,
                        ),
                      ):SizedBox.shrink(),
                      horizontalSpace(5),
                      Text(
                        '29.0 ${LocaleKeys.lyd.tr()}',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.redColor.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(10)
              ],
            ),
          )
        ],
      ),
    );
  }
}
