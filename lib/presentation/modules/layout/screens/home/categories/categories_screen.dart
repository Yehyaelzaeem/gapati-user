import 'package:delivego/core/utils/globals.dart';
import 'package:delivego/presentation/component/component.dart';
import 'package:delivego/presentation/component/images/custom_image.dart';
import 'package:delivego/presentation/modules/layout/screens/home/home_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/color.dart';
import '../../../../../../data/model/response/store_types_model.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/custom_text_field.dart';
import '../../../../../component/texts/black_texts.dart';
import '../../more/address/address_cubit.dart';
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
    AddressCubit addressCubit =AddressCubit.get(context);
    HomeCubit homeCubit = HomeCubit.get(context);
    homeCubit.getStoreTypes(
        addressCubit.selectedAddress?.lat!=null&&addressCubit.selectedAddress?.lng!=null?
        LatLng(double.parse(addressCubit.selectedAddress?.lat??'0.0'), double.parse(addressCubit.selectedAddress?.lng??'0.0')):
        AddressCubit.get(context).latLng??LatLng(0, 0),
        );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
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
                           cubit.storeTypesModel?.data?.data !=null?
                           ((cubit.storeTypesModel!.data!.data!.length) * 118).h:
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
                             if(cubit.storeTypesModel!=null){
                               if(cubit.storeTypesModel?.data?.data?.isNotEmpty??false){
                                 return Column(
                                   children:[
                                     verticalSpace(50),
                                     ...cubit.storeTypesModel?.data?.data?.map((e) {
                                       return StoreItemWidget(storeTypesData: e,context: context);
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

Widget StoreItemWidget({required StoreTypesData storeTypesData,required BuildContext context}){
  return
    InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
            StoresScreen(categoryId: storeTypesData.id??0, categoryName: storeTypesData.name??'',)));
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
                          label: storeTypesData.name ?? '',
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
                  child: CustomImage(image:storeTypesData.icon ?? '',height: 70.w,width: 70.w,radius: 50,)),
            ],
          ) ,
        ),
      )
    );
}