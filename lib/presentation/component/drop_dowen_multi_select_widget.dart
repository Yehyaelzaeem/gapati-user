// import 'package:cogina_restaurants/presentation/component/custom_loading_widget.dart';
// import 'package:cogina_restaurants/presentation/modules/layout/screens/home/home_cubit.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../../../core/resources/styles.dart';
// import '../../../../core/resources/color.dart';
// import '../../../../core/routing/navigation_services.dart';
// import '../../../../core/translations/locale_keys.dart';
// import '../auth_cubit.dart';
//
// class RestaurantCategoriesWidget extends StatefulWidget {
//   final Function(String) onChanged;
//   const RestaurantCategoriesWidget({super.key, required this.onChanged});
//
//   @override
//   State<RestaurantCategoriesWidget> createState() => _RestaurantCategoriesWidgetState();
// }
//
// class _RestaurantCategoriesWidgetState extends State<RestaurantCategoriesWidget> {
//   AuthCubit cubit =AuthCubit.get(NavigationService.navigationKey.currentContext!);
//
//   @override
//   void initState() {
//     cubit.restaurantCategoriesModel=null;
//     cubit.getRestaurantCategories();
//     super.initState();
//   }
//
//   String? selectedValue;
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AuthCubit, AuthState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         if(cubit.restaurantCategoriesModel!=null)
//         return Padding(
//           padding: EdgeInsets.only(top: 5.h,bottom: 10.h),
//           child: StatefulBuilder(builder: (BuildContext context,void Function(void Function()) setState){
//             return Column(
//               children: [
//                 DropdownButton2<String>(
//                   isExpanded: true,
//                   underline: const SizedBox.shrink(),
//                   hint: Text(selectedValue!=null?selectedValue??'':'${LocaleKeys.categories.tr()}', style:
//                   selectedValue!=null?TextStyles.font16Black500Weight:TextStyles.font16Black500Weight.copyWith(color: Colors.grey),),
//                   items:
//                   cubit.restaurantTypesModel?.data==null?[]:
//                   cubit.restaurantTypesModel?.data?.map(( e) => DropdownMenuItem<String>(
//                     value: e.name,
//                     child: Text(
//                       e.name??'',
//                       style: TextStyles.font15CustomGray400Weight.copyWith(
//                           fontSize: 20
//                       ),
//                     ),
//                   )).toList()??[],
//                   onChanged: (String? value) {
//                     widget.onChanged.call(value??'');
//                     setState((){selectedValue=value??'';});
//                   },
//                   dropdownStyleData: DropdownStyleData(
//                     maxHeight: 200.h, // Set the fixed height here
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(10.r),
//                     ),
//                   ),
//                   iconStyleData: IconStyleData(
//                       icon: cubit.restaurantTypesModel == null?
//                       const CustomLoadingWidget():
//                       const Icon(Icons.keyboard_arrow_down)
//                   ) ,
//                   buttonStyleData: ButtonStyleData(
//                       decoration: BoxDecoration(
//                         color: backGroundGray,
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(50.r),
//                       ),
//                       padding: EdgeInsets.symmetric(horizontal: 16.w) // Adjust the horizontal padding as needed
//
//                   ),
//
//                 ),
//               ],
//             );
//           }),
//         );
//         else
//         return const SizedBox();
//
//       },
//     );
//   }
// }
//
//
//
