import 'package:delivego/core/assets_constant/images.dart';
import 'package:delivego/core/resources/color.dart';
import 'package:delivego/data/model/response/home_params.dart';
import 'package:delivego/presentation/component/component.dart';
import 'package:delivego/presentation/component/custom_not_found_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/custom_rate.dart';
import '../../../../../component/images/custom_image.dart';
import '../../../../../component/texts/black_texts.dart';
import '../../more/address/address_cubit.dart';
import '../home_cubit.dart';

class StoresScreen extends StatefulWidget {
  final int categoryId;
  final String categoryName;
  const StoresScreen({super.key, required this.categoryId, required this.categoryName});
  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  @override
  void initState() {
    HomeCubit homeCubit = HomeCubit.get(context);
    AddressCubit addressCubit =AddressCubit.get(context);

    homeCubit.getStores(params: HomeParams(
      latLng:
      addressCubit.selectedAddress?.lat!=null&&addressCubit.selectedAddress?.lng!=null?
      LatLng(double.parse(addressCubit.selectedAddress?.lat??'0.0'), double.parse(addressCubit.selectedAddress?.lng??'0.0')):
      AddressCubit.get(context).latLng??LatLng(0, 0),
      storeId: widget.categoryId
    ));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit =HomeCubit.get(context);
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: CustomAppBar(
          title: widget.categoryName,
        ),
        body:
        BlocBuilder<HomeCubit,HomeState>(
          builder: (context,state){
            if(cubit.storesModel!=null){
              if (cubit.storesModel?.data?.isNotEmpty??false) {
                return  ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: cubit.storesModel?.data?.length,
                    itemBuilder: (context,index){
                      final data =cubit.storesModel?.data?[index];
                      return  InkWell(
                        onTap: () {
                          NavigationService.push(RoutesRestaurants.restaurantScreen,arguments: {'id':data?.id,'storeName':data?.name,
                            'image':data?.banner,'isFav':data?.inFav,'categoryId':data?.category?.id??0,'branchId':data?.branch?.id??0});
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
                                image:data?.image ?? '',
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
                                          CustomImage(image: data?.image ?? '',width: 35.w,height: 35.h,radius: 50,),
                                          horizontalSpace(10),
                                          BlackMediumText(
                                            labelColor: Colors.white,
                                            label: data?.name ?? "",
                                            fontSize: 14.sp,

                                          ),
                                        ],
                                      ),
                                      RatingWidget(
                                        filledStar: Icons.star,
                                        halfStar: Icons.star_half,
                                        emptyStar: Icons.star_border,
                                        rating:double.parse( data?.rate?.toString()??'0'),
                                        onChanged: (double val) {},
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      );
                    });
              } else{
                return Center(
                  child: CustomNotFoundDataWidget(title:  LocaleKeys.notFoundData.tr(), type: 'svg', image: AppImages.fav,),
                );
              }
            }else{
              return Center(
                child: CustomLoadingSpinner(color: primaryColor,),
              );
            }

          },
        )
    );
  }
}
