import 'package:cogina/core/helpers/toast_states/enums.dart';
import 'package:cogina/presentation/modules/layout/screens/home/widgets/custom_restaurants_list.dart';
import 'package:cogina/presentation/modules/layout/screens/home/widgets/offers_widgets.dart';
import 'package:cogina/presentation/modules/layout/screens/home/widgets/shimmer_offers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../search/search_cubit.dart';
import 'widgets/shimmer_restaurant.dart';
import 'home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit =HomeCubit.get(context);
    cubit.getOffers();
    return   Container(
      color: AppColors.backGroundPink,
      child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                  height: 236.h,
                                  child:
                                  Container(
                                      alignment: Alignment.centerRight,
                                      child: Image.asset(RestaurantImages.home1))
                              ),

                              // Positioned(
                              //   bottom: 65.h,
                              //   left: 10.w,
                              //   child:  Text(LocaleKeys.goodMorning.tr(),
                              //     style: TextStyles.font20Black700Weight.copyWith(
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 18.sp,
                              //
                              //     ),
                              //   ),),
                              Positioned(
                                  top: 20.h,
                                  right: 10.w,
                                  child: InkWell(
                                    onTap: (){
                                      SearchCubit searchCubit =SearchCubit.get(context);
                                      searchCubit.searchController.text='';
                                      searchCubit.changeSearchStart(false);
                                      NavigationService.push(RoutesRestaurants.searchScreen);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: AppColors.whiteColor,
                                          boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 5,
                                              offset: Offset(1, 4)
                                          )]
                                      ),
                                      child:  Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(Icons.search,size: 27,color: AppColors.customGray.withOpacity(0.5),),
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  top: 20.h,
                                  left: 10.w,
                                  child: InkWell(
                                    onTap: (){
                                      NavigationService.push(RoutesRestaurants.notification);
                                    },
                                    child:
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: AppColors.whiteColor,
                                          boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 5,
                                              offset: Offset(1, 4)
                                          )]
                                      ),
                                      child:  Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(Icons.notifications_none_rounded,size: 27,color: AppColors.customGray.withOpacity(0.5),),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: AppColors.customWhite,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              // height: 100,
                              child:Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 25.h),
                                child: Column(
                                  children: [
                                    if(cubit.listData==null)
                                      const RestaurantShimmerWidget()
                                    else
                                     const CustomRestaurantsListWidget(),
                                    verticalSpace(8),
                                    Row(
                                      children: [
                                        Text(LocaleKeys.offerMeals.tr(), style: TextStyles.font18Black700Weight,),
                                        const Spacer(),
                                        cubit.offerList!=null && cubit.offerList!.isNotEmpty?
                                        cubit.offerList!.length>2?
                                        InkWell(
                                            onTap: (){
                                              if(cubit.offerList!=null && cubit.offerList!.isNotEmpty){
                                                NavigationService.push(RoutesRestaurants.offersScreen);
                                              }else{
                                                showToast(text: LocaleKeys.notFoundData.tr(), state: ToastStates.error, context: context);
                                              }                                            },
                                            child: Text(LocaleKeys.seeAll.tr(), style: TextStyles.font15CustomGray400Weight,)):SizedBox.shrink():SizedBox.shrink(),
                                      ],
                                    ),
                                    if(cubit.offerList!=null && cubit.offerList!.isNotEmpty)
                                      const OffersWidget()
                                    else
                                      const OffersShimmerWidget(),
                                    verticalSpace(10),
                                    InkWell(
                                      onTap: (){
                                        if(cubit.offerList!=null && cubit.offerList!.isNotEmpty){
                                          NavigationService.push(RoutesRestaurants.offersScreen);
                                        }else{
                                          showToast(text: LocaleKeys.notFoundData.tr(), state: ToastStates.error, context: context);
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(RestaurantImages.banner,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    verticalSpace(30 ),
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  );
              },
            ),
    );

  }
}