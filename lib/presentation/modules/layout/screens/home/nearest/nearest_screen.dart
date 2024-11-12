import 'package:delivego/presentation/component/component.dart';
import 'package:delivego/presentation/modules/layout/screens/home/home_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../data/model/response/home_model.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/custom_rate.dart';
import '../../../../../component/images/custom_image.dart';
import '../../../../../component/texts/black_texts.dart';
class NearestScreen extends StatelessWidget {
  final List<DataModelData> list;
  const NearestScreen({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        title: LocaleKeys.nearest.tr(),
      ),
      body:
      ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: list.length,
          itemBuilder: (context,index){
        return  InkWell(
          onTap: () {
            NavigationService.push(RoutesRestaurants.restaurantScreen,arguments:
            {'id':list[index].id,'storeName':list[index].name,'image':list[index].banner,'isFav':list[index].inFav,
              'categoryId':list[index].category?.id??0,'branchId':list[index].branch!.isEmpty?0:list[index].branch?[0].id??0});
          },
          child:
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 2,
                  offset: Offset(5, 3), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              children: [
                CustomImage(
                  width: double.infinity,
                  height: 186.h,
                  image: list[index].image ?? '',
                  fit: BoxFit.fill,
                  radius: 12,
                ),
                Container(
                  width: double.infinity,
                  height: 186.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: SizedBox(),
                ),
                Positioned(
                    bottom: 10,
                    right: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                       Row(
                         children: [
                           CustomImage(image: list[index].image ?? '',width: 35.w,height: 35.h,radius: 50,),
                           horizontalSpace(10),
                            BlackMediumText(
                             labelColor: Colors.white,
                             label: list[index].name ?? "",
                             fontSize: 14.sp,

                           ),
                         ],
                       ),
                        RatingWidget(
                          filledStar: Icons.star,
                          halfStar: Icons.star_half,
                          emptyStar: Icons.star_border,
                          rating:double.parse( list[index].rate?.toString()??'0'),
                          onChanged: (double val) {},
                        )
                      ],
                    ))
              ],
            ),
          ),
        );
      })
    );
  }
}

