// import 'package:delivego/generated/locale_keys.g.dart';
// import 'package:delivego/presentation/component/component.dart';
// import 'package:delivego/presentation/component/custom_loading_widget.dart';
// import 'package:delivego/presentation/component/images/custom_image.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import '../../../../../../core/helpers/spacing.dart';
// import '../../../../../../core/routing/navigation_services.dart';
// import '../../../../../../core/routing/routes.dart';
// import '../../../../../../data/model/response/home_params.dart';
// import '../../../../../component/custom_rate.dart';
// import '../../../../../component/texts/black_texts.dart';
// import '../../more/address/address_cubit.dart';
// import '../home_cubit.dart';
//
// class HomeSubCategoriesWidget extends StatelessWidget {
//   const HomeSubCategoriesWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     HomeCubit cubit = HomeCubit.get(context);
//     return BlocConsumer<HomeCubit, HomeState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           if (cubit.storesModel == null) {
//             return Center(
//               child: CustomLoadingWidget(),
//             );
//           }else if(cubit.storesModel!.data!.isEmpty){
//            return  BlackMediumText(
//              label: LocaleKeys.notFoundData.tr(),
//              fontSize: 14.sp,
//            );
//           }else{
//           return SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 ...cubit.storesModel?.data
//                         ?.map((e) => InkWell(
//                               onTap: () {
//                                 NavigationService.push(RoutesRestaurants.restaurantScreen,arguments:
//                                 {'id':e.id,'storeName':e.name,'image':e.banner,'isFav':e.inFav,'categoryId':e.category?.id??0,'branchId':e.branch?.id??0});
//                               },
//                               child:
//                               Container(
//                                 margin: EdgeInsets.symmetric(horizontal: 5.w),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.white,
//                                 ),
//                                 child: Stack(
//                                   children: [
//                                     CustomImage(
//                                       width: 250.w,
//                                       height: 135.h,
//                                       image: e.image ?? '',
//                                       fit: BoxFit.fill,
//                                       radius: 12,
//                                     ),
//                                     Container(
//                                       width: 250.w,
//                                       height: 135.h,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(12),
//                                         gradient: LinearGradient(
//                                           begin: Alignment.bottomCenter,
//                                           end: Alignment.topCenter,
//                                           colors: [
//                                             Colors.black.withOpacity(0.8),
//                                             Colors.black.withOpacity(0.4),
//                                             Colors.black.withOpacity(0.1),
//                                           ],
//                                         ),
//                                       ),
//                                       child: SizedBox(),
//                                     ),
//                                     Positioned(
//                                         bottom: 10,
//                                         right: 16,
//                                         left: 16,
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             BlackMediumText(
//                                               labelColor: Colors.white,
//                                               label: e.name ?? "",
//                                               fontSize: 14.sp,
//
//                                             ),
//                                             RatingWidget(
//                                               filledStar: Icons.star,
//                                               halfStar: Icons.star_half,
//                                               emptyStar: Icons.star_border,
//                                               rating:double.parse( e.rate?.toString()??'0'),
//                                               onChanged: (double val) {},
//                                             )
//                                           ],
//                                         ))
//                                   ],
//                                 ),
//                               ),
//                             ))
//                         .toList() ??
//                     [],
//               ],
//             ),
//           );
//         }});
//   }
// }
