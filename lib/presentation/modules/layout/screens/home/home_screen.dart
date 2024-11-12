
import 'package:delivego/presentation/component/custom_text_field.dart';
import 'package:delivego/presentation/modules/layout/screens/home/widgets/custom_row_title_widget.dart';
import 'package:delivego/presentation/modules/layout/screens/home/widgets/home_categories_widget.dart';
import 'package:delivego/presentation/modules/layout/screens/home/widgets/home_location_widget.dart';
import 'package:delivego/presentation/modules/layout/screens/home/widgets/home_nearest_widget.dart';
import 'package:delivego/presentation/modules/layout/screens/home/widgets/home_offers_widget.dart';
import 'package:delivego/presentation/modules/layout/screens/home/widgets/home_sub_categories_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../component/images/custom_image_slider.dart';
import '../../../search/search_cubit.dart';
import '../more/address/address_cubit.dart';
import 'nearest/nearest_screen.dart';
 import 'home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit =HomeCubit.get(context);
    cubit.getOffers();
    return   Container(
      width: double.infinity,
      color: AppColors.whiteColor,
      child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                return
                  RefreshIndicator(
                      onRefresh: ()async{
                      await  Future.delayed(const Duration(seconds: 1), () {
                        AddressCubit addressCubit =AddressCubit.get(context);
                          cubit.getStoreTypes( addressCubit.selectedAddress?.lat!=null&&addressCubit.selectedAddress?.lng!=null?
                          LatLng(double.parse(addressCubit.selectedAddress?.lat??'0.0'), double.parse(addressCubit.selectedAddress?.lng??'0.0')):
                          AddressCubit.get(context).latLng??LatLng(0, 0));
                        });
                        },
                    child:  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 60.h)+EdgeInsets.symmetric(horizontal: 2.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Padding(padding:EdgeInsets.symmetric(horizontal: 10.w) ,
                      child:  Column(
                        children: [
                          HomeLocationWidget(),
                          verticalSpace(16),
                          InkWell(
                            onTap: (){
                              print('onTap');
                              SearchCubit searchCubit =SearchCubit.get(context);
                              searchCubit.searchController.text='';
                              searchCubit.changeSearchStart(false);
                              NavigationService.push(RoutesRestaurants.searchScreen);
                            },
                            child: CustomTextField(
                              onTap: (){

                              },
                              contentVerticalPadding: 10,
                              hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                              fillColor: AppColors.greyColor.withOpacity(0.3),
                              borderColor: AppColors.whiteColor.withOpacity(0.0),
                              borderRadius: 16,
                              prefixIcon:  Icon(Icons.search,color:Colors.grey),
                              hintText: LocaleKeys.search.tr(),
                              hintColor: AppColors.black,
                              enabled: false,
                              controller: TextEditingController(),),
                          ),
                        ],),),
                        verticalSpace(20),
                        CustomImageSlider(
                            height: 120.h,
                            margin: EdgeInsets.symmetric(horizontal: 0.w),
                            imageWidth: 280.w,
                            width: double.infinity,
                            radius:  kFormRadiusSmall+10,
                            sliders: cubit.bannersModel?.data?.data?.map((e) => e.image??'').toList()??[]),
                        verticalSpace(25),
                        CustomRowTitleWidget(
                          title: LocaleKeys.categories.tr(),
                          image: AppImages.star,
                          onTap: (){
                            NavigationService.push(RoutesRestaurants.categoriesScreen);
                          },
                          length: cubit.storeTypesModel?.data?.data?.length??0,
                        ),
                        verticalSpace(16),
                        HomeCategoriesWidget(),
                        verticalSpace(30),
                        HomeSubCategoriesWidget(),
                        verticalSpace(30),
                        CustomRowTitleWidget(
                          title: LocaleKeys.beastOffers.tr(),
                          image: AppImages.star,
                          onTap: (){
                            NavigationService.push(RoutesRestaurants.offersScreen);
                          },
                          length: cubit.homeModel?.offerData?.data?.length??0,
                        ),
                        verticalSpace(16),
                        HomeOffersWidget(),
                        verticalSpace(16),
                        CustomRowTitleWidget(
                          title: LocaleKeys.nearest.tr(),
                          image: AppImages.star,
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>NearestScreen(list: cubit.homeModel?.data?.data??[],)));
                           },
                          length: cubit.homeModel?.data?.data?.length??0,
                        ),
                        verticalSpace(16),
                        HomeNearestWidget(),
                        verticalSpace(100),

                        // Container(
                        //     decoration: BoxDecoration(
                        //         color: AppColors.customWhite,
                        //         borderRadius: BorderRadius.circular(20)
                        //     ),
                        //     // height: 100,
                        //     child:Padding(
                        //       padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 25.h),
                        //       child: Column(
                        //         children: [
                        //           if(cubit.restaurantList==null)
                        //             const RestaurantShimmerWidget()
                        //           else
                        //            const CustomRestaurantsListWidget(),
                        //           verticalSpace(8),
                        //           Row(
                        //             children: [
                        //               Text(LocaleKeys.offerMeals.tr(), style: TextStyles.font18Black700Weight,),
                        //               const Spacer(),
                        //               cubit.offerList!=null && cubit.offerList!.isNotEmpty?
                        //               cubit.offerList!.length>2?
                        //               InkWell(
                        //                   onTap: (){
                        //                     if(cubit.offerList!=null && cubit.offerList!.isNotEmpty){
                        //                       NavigationService.push(RoutesRestaurants.offersScreen);
                        //                     }else{
                        //                       showToast(text: LocaleKeys.notFoundData.tr(), state: ToastStates.error, context: context);
                        //                     }                                            },
                        //                   child: Text(LocaleKeys.seeAll.tr(), style: TextStyles.font15CustomGray400Weight,)):SizedBox.shrink():SizedBox.shrink(),
                        //             ],
                        //           ),
                        //           if(cubit.offerList!=null && cubit.offerList!.isNotEmpty)
                        //             const OffersWidget()
                        //           else
                        //             const OffersShimmerWidget(),
                        //           verticalSpace(10),
                        //           InkWell(
                        //             onTap: (){
                        //               if(cubit.offerList!=null && cubit.offerList!.isNotEmpty){
                        //                 NavigationService.push(RoutesRestaurants.offersScreen);
                        //               }else{
                        //                 showToast(text: LocaleKeys.notFoundData.tr(), state: ToastStates.error, context: context);
                        //               }
                        //             },
                        //             child: Padding(
                        //               padding: const EdgeInsets.all(10.0),
                        //               child: Image.asset(AppImages.banner,
                        //                 width: double.infinity,
                        //                 fit: BoxFit.fill,
                        //               ),
                        //             ),
                        //           ),
                        //           verticalSpace(30 ),
                        //         ],
                        //       ),
                        //     )
                        // ),
                      ],
                    ),
                  ), );
              },
            ),
    );

  }
}