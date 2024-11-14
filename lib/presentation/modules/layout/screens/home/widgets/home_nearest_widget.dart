import 'package:delivego/presentation/component/images/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../component/custom_rate.dart';
import '../../../../../component/texts/black_texts.dart';
import '../home_cubit.dart';

class HomeNearestWidget extends StatelessWidget {
  const HomeNearestWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    // return BlocConsumer<HomeCubit, HomeState>(
    //     listener: (context, state) {},
    //     builder: (context, state) {
    //       return SingleChildScrollView(
    //         physics: const BouncingScrollPhysics(),
    //         scrollDirection: Axis.horizontal,
    //         child: Row(
    //           children: [
    //             ...cubit.homeModel?.data?.data
    //                     ?.map((e) =>
    //                 InkWell(
    //                           onTap: () {
    //                             NavigationService.push(RoutesRestaurants.restaurantScreen,arguments:
    //                             {'branchId':e.branch!.isEmpty?0:e.branch?[0].id??0,'id':e.id,'storeName':e.name,'image':e.banner,'isFav':e.inFav,'categoryId':e.category?.id??0});
    //                           },
    //                           child:
    //                           Container(
    //                             margin: EdgeInsets.symmetric(horizontal: 5.w),
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(10),
    //                               color: Colors.white,
    //                             ),
    //                             child: Stack(
    //                               children: [
    //                                 CustomImage(
    //                                   width: 312.w,
    //                                   height: 186.h,
    //                                   image: e.image ?? '',
    //                                   fit: BoxFit.fill,
    //                                   radius: 12,
    //                                 ),
    //                                 Container(
    //                                   width: 312.w,
    //                                   height: 186.h,
    //                                   decoration: BoxDecoration(
    //                                     borderRadius: BorderRadius.circular(12),
    //                                     gradient: LinearGradient(
    //                                       begin: Alignment.bottomCenter,
    //                                       end: Alignment.topCenter,
    //                                       colors: [
    //                                         Colors.black.withOpacity(0.8),
    //                                         Colors.black.withOpacity(0.4),
    //                                         Colors.black.withOpacity(0.1),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                   child: SizedBox(),
    //                                 ),
    //                                 Positioned(
    //                                     bottom: 10,
    //                                     right: 16,
    //                                     left: 16,
    //                                     child: Column(
    //                                       crossAxisAlignment:
    //                                           CrossAxisAlignment.start,
    //                                       children: [
    //                                         BlackMediumText(
    //                                           labelColor: Colors.white,
    //                                           label: e.name ?? "",
    //                                           fontSize: 14.sp,
    //
    //                                         ),
    //                                         RatingWidget(
    //                                           filledStar: Icons.star,
    //                                           halfStar: Icons.star_half,
    //                                           emptyStar: Icons.star_border,
    //                                           rating:double.parse( e.rate?.toString()??'0'),
    //                                           onChanged: (double val) {},
    //                                         )
    //                                       ],
    //                                     ))
    //                               ],
    //                             ),
    //                           ),
    //                         ))
    //                     .toList() ??
    //                 [],
    //           ],
    //         ),
    //       );
    //     });
    return Text('sda');
  }
}
