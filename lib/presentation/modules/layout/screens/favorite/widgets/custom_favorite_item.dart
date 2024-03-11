import 'package:cogina/core/helpers/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';

class CustomFavoriteItem extends StatelessWidget {
   CustomFavoriteItem({super.key});
  bool isFav =true;
  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                      Image.asset(RestaurantImages.bur1)
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
                ],
              ),
            ),
          ),
          Column(
            children: [
              Center(
                child:
                Text(
                  'Checken',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child:
                Text(
                  '\$29.0',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.redColor.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              verticalSpace(10)
            ],
          )
        ],
      ),
    );
  }
}
