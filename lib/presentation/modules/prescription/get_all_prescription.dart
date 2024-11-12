import 'package:delivego/core/assets_constant/images.dart';
import 'package:delivego/core/resources/color.dart';
import 'package:delivego/generated/locale_keys.g.dart';
import 'package:delivego/presentation/component/component.dart';
import 'package:delivego/presentation/component/custom_elevated_button.dart';
import 'package:delivego/presentation/component/custom_not_found_data.dart';
import 'package:delivego/presentation/component/images/custom_image.dart';
import 'package:delivego/presentation/component/texts/black_texts.dart';
import 'package:delivego/presentation/component/texts/hint_texts.dart';
import 'package:delivego/presentation/component/texts/primary_texts.dart';
import 'package:delivego/presentation/modules/prescription/prescription_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global/styles/colors.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/utils/contact_helper.dart';
import '../../../data/model/response/accept_prescriptoin_params.dart';
import '../../../data/model/response/prescriptions_model.dart';

class GetAllPrescription extends StatelessWidget {
  const GetAllPrescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PrescriptionCubit>();
    cubit.getPrescriptions();
   return Scaffold(
     backgroundColor: Colors.grey.shade300,
     // appBar: CustomAppBar(
     //   title: LocaleKeys.prescription.tr(),
     //
     // ),
     body:
     BlocBuilder<PrescriptionCubit, PrescriptionState>( builder: (context, state) {
       if(cubit.prescriptionsModel!=null){
         if(cubit.prescriptionsModel!.data!=null && cubit.prescriptionsModel!.data!.isNotEmpty){
           return  ListView.builder(
               physics: const BouncingScrollPhysics(),
               padding: EdgeInsets.symmetric(horizontal: 0.w,)+EdgeInsets.only(bottom: 50.h),
               itemCount: cubit.prescriptionsModel!.data!.length,
               itemBuilder: (context, index) {
                 final item = cubit.prescriptionsModel!.data![index];
                 return
                   Container(
                   padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                   margin: EdgeInsets.symmetric(vertical: 8.h),
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10)),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       headerPrescription(context,item),
                       Divider(color: Colors.grey.shade300,),
                       HintBoldText(label: '${LocaleKeys.notes.tr()} :-', fontSize: 12.sp,),
                       Padding(padding:EdgeInsets.symmetric(horizontal: 16.w),
                       child:  BlackMediumText(label: '${item.note??''}', fontSize: 14.sp,),
                       ),
                       verticalSpace(10),
                       InkWell(
                         onTap: (){
                           ImageProvider imageProvider = NetworkImage(item.image??'');
                           openBottomSheet(context, imageProvider);
                         },
                         child:  CustomImageOnlyRadius(image:item.image??'',
                           topRightRadius: 12,
                           topLeftRadius: 12,
                           height: 250.h,
                           width: double.infinity,
                           fit: BoxFit.contain,
                         ),
                       ),

                       verticalSpace(10),
                       if(item.storesNote!=null)
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           HintBoldText(label: '${LocaleKeys.storeNote.tr()} :- ',fontSize: 12.sp,),
                           Padding(
                             padding: EdgeInsets.symmetric(horizontal: 16.w),
                           child: BlackMediumText(label: '${item.storesNote??''}',labelColor: Colors.grey.shade400, fontSize: 14.sp,),
                           )
                         ],
                       ),

                       Divider(color: Colors.grey.shade300,),
                       if(item.price!=null)
                       bottomPrescription(context,item)
                       else
                          Center(child: HintBoldText(label: '${LocaleKeys.waiting.tr()}',fontSize: 14.sp,),),
                     ],
                   ),
                 );

               });

         }else{
            return CustomNotFoundDataWidget(title: '${LocaleKeys.notFoundData.tr()}', type: 'svg', image: AppImages.fav);
         }
         }else{
         return Center(child: CustomLoadingSpinner());
       }
     })
   );
  }
}

Widget headerPrescription(BuildContext context,PrescriptionsModelData item){
  return Row(
    children: [
      Expanded(child: InkWell(
        onTap: (){
        },
        child: Row(
          children: [
            CustomImage(image: '',
              radius: 60,
              height: 45,
              width: 45,
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlackMediumText(label: '${item.store?.name??''} , ${item.branch?.name??''}'),
                  verticalSpace(5),
                  BlackMediumText(label: item.branch?.address??''),

                ],
              ),
            ),
          ],
        ),
      )),
      InkWell(

        onTap: (){
          ContactHelper.launchCall(item.branch?.phone??'');
        },
        child: CircleAvatar(
          radius: 20,
          backgroundColor:Colors.blue.shade400,
          child: Icon(Icons.phone, color: Colors.white,),
        ),
      ),
      horizontalSpace(10),
      InkWell(
        onTap: (){
          ContactHelper.launchMap(lat: double.parse(item.branch?.lat?.toString()??'0.0'), long: double.parse(item.branch?.lng?.toString()??'0.0'));
        },
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.red.shade400,
          child: Icon(Icons.location_on_rounded, color: Colors.white,),
        ),
      ),




    ],
  );
}
Widget bottomPrescription(BuildContext context,PrescriptionsModelData item){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       Row(
         children: [
          Expanded(child:  Column(
            children: [
              Row(
                children: [
                  BlackMediumText(label: '${LocaleKeys.price.tr()} : ',labelColor: Colors.grey.shade500,fontSize: 12.sp,),
                  BlackMediumText(label: '${item.price??''} ${LocaleKeys.lyd.tr()}',labelColor: Colors.grey.shade500,fontSize: 12.sp,),
                ],
              ),
              Row(
                children: [
                  BlackMediumText(label: '${LocaleKeys.shipping.tr()} : ',labelColor: Colors.grey.shade500,fontSize: 12.sp,),
                  BlackMediumText(label: '${item.deliveryPrice??''} ${LocaleKeys.lyd.tr()}',labelColor: Colors.grey.shade500,fontSize: 12.sp,),
                ],
              ),
            ],
          )),
            Container(
              height: 40.h,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(8),
                 boxShadow: [
                   item.status=='user_accepted'?BoxShadow():
                   BoxShadow(
                     color: Colors.black45,
                     blurRadius: 2,
                     spreadRadius: 0,
                     offset: Offset(2, 2),
                   ),
                 ],

              ),
              child:
                  item.status=='user_accepted'?
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: primaryColor,width: 1),
                          borderRadius: BorderRadius.circular(8),

                        ),
                        child: Center(
                          child: PrimaryBoldText(label: '${LocaleKeys.inPreparation.tr()}',fontSize: 14.sp,),
                        ),
                      ):
              BlocConsumer<PrescriptionCubit, PrescriptionState>(
                listener: (context, state) {},
                builder: (context, state) {
                 return  CustomElevatedButton(
                   isLoading: state is AcceptPrescriptionLoading,
                 loadingSize: 33,
                 height: 40.h,
                 borderColor: Colors.white,
                 borderRadius: 8,
                 onTap: (){
                   final cubit = context.read<PrescriptionCubit>();
                   cubit.acceptPrescription(params: AcceptPrescriptionParams(id:
                   item.id??0,paymentMethod:'cash'),context: context);
                 },
                 buttonText: LocaleKeys.accept.tr(),
                 );}),
            )
         ],
       ),
       Container(
         width: 150.w,
         child:  Divider(color: Colors.grey.shade300,),
       ),
       Row(
        children: [
          BlackMediumText(label: '${LocaleKeys.totalPrice.tr()} : ',labelColor: Colors.grey.shade500,fontSize: 14.sp,),
          BlackMediumText(label: '${(item.deliveryPrice??0) + (item.price??0)} ${LocaleKeys.lyd.tr()}',labelColor: Colors.grey.shade500,fontSize: 16.sp,),
        ],
      ),





    ],
  );
}