import 'package:delivego/presentation/component/component.dart';
import 'package:delivego/presentation/component/texts/black_texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../component/images/custom_image.dart';
import '../home_cubit.dart';

class CustomerOpinionsHomeWidget extends StatelessWidget {
  const CustomerOpinionsHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...list.map((e) => Container(
                  margin:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 2,
                        offset: Offset(2, 4),
                      )
                    ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomImage(
                            width: 25.w,
                            height: 25.w,
                            image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0ZP9zTf75vBmTD9BJWQmf3DjamXGuvzw44w&s',
                            fit: BoxFit.fill,
                            radius: 12,
                          ),
                          horizontalSpace(8),
                          BlackMediumText(label: 'أحمد', fontSize: 12.sp),
                        ],
                      ),
                      verticalSpace(5),
                      BlackMediumText(label: 'أفضل مطعم أفضل مطعم أفضل مطعم أفضل مطعم', fontSize: 8.sp),
                      verticalSpace(5),
                     Center(
                       child:  RateWidget(initialRating: 4,),
                     )
                    ],
                  ),

                )).toList() ??[],
                // ...cubit.homeModel?.data?.data
                //         ?.map((e) =>
                //     InkWell(
                //               onTap: () {
                //                 NavigationService.push(RoutesRestaurants.restaurantScreen,arguments:
                //                 {'branchId':e.branch!.isEmpty?0:e.branch?[0].id??0,'id':e.id,'storeName':e.name,'image':e.banner,'isFav':e.inFav,'categoryId':e.category?.id??0});
                //               },
                //               child:
                //               Container(
                //                 margin: EdgeInsets.symmetric(horizontal: 5.w),
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(10),
                //                   color: Colors.white,
                //                 ),
                //                 child: Stack(
                //                   children: [
                //                     CustomImage(
                //                       width: 312.w,
                //                       height: 186.h,
                //                       image: e.image ?? '',
                //                       fit: BoxFit.fill,
                //                       radius: 12,
                //                     ),
                //                     Container(
                //                       width: 312.w,
                //                       height: 186.h,
                //                       decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(12),
                //                         gradient: LinearGradient(
                //                           begin: Alignment.bottomCenter,
                //                           end: Alignment.topCenter,
                //                           colors: [
                //                             Colors.black.withOpacity(0.8),
                //                             Colors.black.withOpacity(0.4),
                //                             Colors.black.withOpacity(0.1),
                //                           ],
                //                         ),
                //                       ),
                //                       child: SizedBox(),
                //                     ),
                //                     Positioned(
                //                         bottom: 10,
                //                         right: 16,
                //                         left: 16,
                //                         child: Column(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.start,
                //                           children: [
                //                             BlackMediumText(
                //                               labelColor: Colors.white,
                //                               label: e.name ?? "",
                //                               fontSize: 14.sp,
                //
                //                             ),
                //                             RatingWidget(
                //                               filledStar: Icons.star,
                //                               halfStar: Icons.star_half,
                //                               emptyStar: Icons.star_border,
                //                               rating:double.parse( e.rate?.toString()??'0'),
                //                               onChanged: (double val) {},
                //                             )
                //                           ],
                //                         ))
                //                   ],
                //                 ),
                //               ),
                //             ))
                //         .toList() ??
                //     [],
              ],
            ),
          );
        });
  }
}
List<int> list = [1,2,3,4,5,6,7];