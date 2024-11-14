import 'package:delivego/presentation/component/images/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/color.dart';
import '../../../../../../data/model/response/home_params.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/texts/black_texts.dart';
import '../../more/address/address_cubit.dart';
import '../home_cubit.dart';
import '../meal/best_dish_meal/best_dish_meal_screen.dart';
import '../meal/meals_screen.dart';

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
                  if(cubit.bestDishModel!=null && cubit.bestDishModel!.data!=null && cubit.bestDishModel!.data!.isNotEmpty)
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                            BestDishMealsScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(500),
                              child:  Image.asset(AppImages.logo, width: 70.w, height: 70.w,),
                            ),
                            verticalSpace(10),
                            BlackMediumText(
                              label:'${LocaleKeys.bestDish2.tr()}',
                              fontSize: 12.sp,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ...cubit.categoriesModel?.data
                      ?.map((e) =>
                      InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          MealsScreen(categoryId: e.id??0, categoryName: e.name??'',)));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          CustomImage(
                            width: 70.w,
                            height: 70.w,
                            image: e.icon??'',
                            radius: 500,
                          ),
                          verticalSpace(10),
                          BlackMediumText(
                            label: e.name ?? "",
                            fontSize: 12.sp,
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
