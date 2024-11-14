import 'package:delivego/core/utils/globals.dart';
import 'package:delivego/data/model/response/categories_model.dart';
import 'package:delivego/presentation/component/component.dart';
import 'package:delivego/presentation/component/images/custom_image.dart';
import 'package:delivego/presentation/modules/layout/screens/home/home_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/color.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/custom_text_field.dart';
import '../../../../../component/texts/black_texts.dart';
import '../../more/address/address_cubit.dart';
import '../meal/best_dish_meal/best_dish_meal_screen.dart';
import '../meal/meals_screen.dart';
import '../stores/stores_screen.dart';
import '../widgets/home_location_widget.dart';
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    HomeCubit homeCubit = HomeCubit.get(context);
    homeCubit.getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    bool hasBestDish =cubit.bestDishModel!=null && cubit.bestDishModel!.data!=null && cubit.bestDishModel!.data!.isNotEmpty;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar:  CustomAppBar(
        title: LocaleKeys.categories.tr(),
      ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 0.w,vertical: 0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      HomeLocationWidget(),
                      verticalSpace(20),
                      InkWell(
                        onTap: (){

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
                      verticalSpace(10),
                    ],
                  )),
                BlocConsumer<HomeCubit, HomeState>(
                 listener: (context, state) {},
                 builder: (context, state) {
                 return  Container(
                     child:
                     Stack(
                       children: [
                         Container(
                           margin: EdgeInsets.only(top: 20.h),
                           alignment: Alignment.centerRight,
                           width: 100.w,
                           height:
                           cubit.categoriesModel?.data !=null?
                           ((hasBestDish==true?cubit.categoriesModel!.data!.length+1:
                               cubit.categoriesModel!.data!.length) * 118).h:
                           MediaQuery.sizeOf(context).height*0.7,
                           decoration: BoxDecoration(
                             color: primaryColor,
                             borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular( kIsArabic==true?50:0),
                                 bottomLeft: Radius.circular(kIsArabic==true?50:0),
                                 topRight: Radius.circular(kIsArabic==false?50:0),
                                 bottomRight: Radius.circular(kIsArabic==false?50:0)
                             ),
                           ),
                         ),
                         BlocConsumer<HomeCubit, HomeState>(
                           builder: (context,state){
                             if(cubit.categoriesModel!=null){
                               if(cubit.categoriesModel?.data?.isNotEmpty??false){
                                 return Column(
                                   children:[
                                     verticalSpace(50),
                                     if(cubit.bestDishModel!=null && cubit.bestDishModel!.data!=null && cubit.bestDishModel!.data!.isNotEmpty)
                                         StoreItemWidget(categoriesModelData: CategoriesModelData(
                                           id: 0,
                                           name: LocaleKeys.bestDish2.tr(),
                                           icon: AppImages.logo,),context: context),
                                       ...cubit.categoriesModel?.data?.map((e) {
                                       return StoreItemWidget(categoriesModelData: e,context: context);
                                     }).toList()??[],
                                     verticalSpace(30),

                                   ],
                                 );
                               }else{
                                 return SizedBox();
                               }
                             }else{
                               return Padding(padding:EdgeInsets.only(top: 350.h) ,
                               child: CustomLoadingSpinner(color: primaryColor,),
                               );
                             }
                           },
                           listener: (context,state){}, )
                       ],
                     ),
                   );
                 },
               )
              ],
            ),
          ),
        )
    );
  }
}

Widget StoreItemWidget({required CategoriesModelData categoriesModelData,required BuildContext context}){
  return
    InkWell(
      onTap: (){
        if(categoriesModelData.id==0){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              BestDishMealsScreen()));
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              MealsScreen(categoryId: categoriesModelData.id??0, categoryName: categoriesModelData.name??'',)));
        }


      },
      child:
      Center(
        child: Container(
          height: 90.h,
          width: 330.w,
          margin:  EdgeInsets.symmetric(vertical: 8.h),
          child: Stack(
            children: [
              Center(
                child:Container(
                  height: 90.h,
                  width: 276.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kIsArabic==true?12:40),
                        bottomLeft: Radius.circular(kIsArabic==true?12:40),
                        topRight: Radius.circular(kIsArabic==true?40:12),
                        bottomRight: Radius.circular(kIsArabic==true?40:12)
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.w,vertical: 0.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlackRegularText(
                          label: categoriesModelData.name ?? '',
                          fontSize: 14.sp,
                        ),
                        verticalSpace(3),
                        BlackRegularText(
                          label: '15 Stores',
                          fontSize: 12.sp,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 25.h,
                  left: kIsArabic==true?10.w:null,
                  right: kIsArabic==true?null:10.w,
                  child:
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.arrow_forward_ios,color: Colors.grey.shade500,size: 20,),
                  )),
              Positioned(
                  top: 10.h,
                  right: kIsArabic==true?0.w:null,
                  left: kIsArabic==true?null:0.w,
                  child:
                  categoriesModelData.id==0?
                  ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.asset(AppImages.logo, width: 70.w, height: 70.w,),):
                  CustomImage(image:categoriesModelData.icon ?? '',height: 70.w,width: 70.w,radius: 50,)),
            ],
          ) ,
        ),
      )
    );
}