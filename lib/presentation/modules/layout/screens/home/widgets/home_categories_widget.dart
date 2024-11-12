import 'package:delivego/presentation/component/images/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/color.dart';
import '../../../../../../data/model/response/home_params.dart';
import '../../../../../component/texts/black_texts.dart';
import '../../more/address/address_cubit.dart';
import '../home_cubit.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return
      BlocConsumer<HomeCubit, HomeState>(
          builder: (context,state){
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...cubit.storeTypesModel?.data?.data
                      ?.map((e) => InkWell(
                    onTap: (){
                      AddressCubit addressCubit =AddressCubit.get(context);
                      cubit.getStores(params: HomeParams(latLng:
                      addressCubit.selectedAddress?.lat!=null&&addressCubit.selectedAddress?.lng!=null?
                          LatLng(double.parse(addressCubit.selectedAddress?.lat??'0.0'), double.parse(addressCubit.selectedAddress?.lng??'0.0')):
                      AddressCubit.get(context).latLng??LatLng(0, 0),storeId: e.id??0));
                      cubit.getHome(params: HomeParams(latLng:
                      addressCubit.selectedAddress?.lat!=null&&addressCubit.selectedAddress?.lng!=null?
                      LatLng(double.parse(addressCubit.selectedAddress?.lat??'0.0'), double.parse(addressCubit.selectedAddress?.lng??'0.0')):
                      AddressCubit.get(context).latLng??LatLng(0, 0)
                          ,storeId: e.id??0));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          CustomImage(
                            width: 88.w,
                            height: 88.w,
                            image: e.icon??'',
                            radius: 500,
                          ),
                          verticalSpace(10),
                          BlackMediumText(
                            label: e.name ?? "",
                            fontSize: 14.sp,
                          ),
                          if (e.id == cubit.currentCategoryId)
                            Container(
                              width: 70,
                              child: Divider(
                                color: Color(0xff26624E),
                                thickness: 2,
                              ),
                            )
                        ],
                      ),
                    ),
                  ))
                      .toList() ??
                      [],
                ],
              ),
            );
          },
          listener: (context, state) {});
  }
}
