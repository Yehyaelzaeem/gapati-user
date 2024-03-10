import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({super.key, this.hasShadow, this.height, this.hasDeleteIcon});
  final bool? hasShadow;
  final double? height;
  final bool? hasDeleteIcon;

  @override
  Widget build(BuildContext context) {
    int x =1;
    int y =30;
    int res =30;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height?? 130.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow:
          hasShadow==true?
          [BoxShadow(color: AppColors.black.withOpacity(0.2),blurRadius: 2,
          offset: const Offset(1,6)
          )]:null
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffDFDADA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(RestaurantImages.bur1),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10.w,),
                      Text('share box',
                        style: TextStyles.font16Black600Weight,
                      ),
                      const Spacer(),
                      const Icon(Icons.favorite_border_rounded,size: 20,),
                      SizedBox(width: 10.w,),
                    ],
                  ),
                  StatefulBuilder(builder: (context,setState){
                    return  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10.w,),
                        Text('\$$res',
                          style: TextStyles.font16Black600Weight.copyWith(
                              color: AppColors.redColor.withOpacity(0.8)
                          ),
                        ),
                        const Spacer(),
                        Row(

                          children: [
                            InkWell(
                              child: const CircleAvatar(
                                backgroundColor: AppColors.backGroundPink2,
                                radius: 13,
                                child: Icon(Icons.remove,color: AppColors.backGroundPink3,weight: 5,size: 20,),
                              ),
                              onTap: (){
                                setState((){
                                  if(x>1){
                                    x--;
                                    res-=y;
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 10.w,),
                            CircleAvatar(
                              backgroundColor: AppColors.sandwichBackGround,
                              radius: 13,
                              child: Text('$x',
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
                                setState((){
                                  x++;
                                  res+=y;
                                });
                              },
                            ),
                          ],
                        ),
                        hasDeleteIcon!=false?  const Spacer():const SizedBox.shrink(),
                        hasDeleteIcon!=false? const Icon(Icons.delete_outline,size: 20,):const SizedBox.shrink(),
                         SizedBox(width: 10.w,),
                      ],
                    );
                  })
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
