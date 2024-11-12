import 'dart:io';
import 'package:delivego/core/helpers/extensions.dart';
import 'package:delivego/core/helpers/spacing.dart';
import 'package:delivego/core/utils/contact_helper.dart';
import 'package:delivego/generated/locale_keys.g.dart';
import 'package:delivego/presentation/component/custom_elevated_button.dart';
import 'package:delivego/presentation/component/custom_text_field.dart';
import 'package:delivego/presentation/component/texts/hint_texts.dart';
import 'package:delivego/presentation/modules/prescription/prescription_cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/global/styles/colors.dart';
import '../../../core/helpers/toast_states/enums.dart';
import '../../../core/routing/routes.dart';
import '../../../data/model/response/prescription_params.dart';
import '../../component/custom_loading_widget.dart';
import '../../component/images/custom_attach_image_sheet.dart';
import '../../component/texts/black_texts.dart';
import '../layout/screens/more/address/address_cubit.dart';

class PrescriptionScreen extends StatelessWidget {
  final int storeId;
  final int branchId;

  PrescriptionScreen({Key? key, required this.storeId, required this.branchId}) : super(key: key);
  File? imageFile;
  TextEditingController _controller = TextEditingController();
  int currentMethod=0;
  int addressId=0;

  @override
  Widget build(BuildContext context) {
    AddressCubit cubit =AddressCubit.get(context);
    cubit.getAllAddress();
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.prescription.tr()),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlackBoldText(label: LocaleKeys.prescription.tr(), fontSize: 16.sp),
              verticalSpace(8),
              DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  padding: EdgeInsets.all(6),
                  child: StatefulBuilder(builder: (context, setState) {
                    return InkWell(
                      onTap: () {
                        // ContactHelper.getImageFromGallery().then((value) {
                        //   setState(() {
                        //     imageFile = value;
                        //   });
                        // });
                        showSelectAttachChatMethods(context,onAttachImage: (path){
                          setState(() {
                            imageFile = File(path);
                          });
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          color: Colors.grey[100],
                          child: imageFile != null
                              ? Image.file(
                                  imageFile!,
                                  fit: BoxFit.cover,
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.upload_file_outlined,
                                        size: 150, color: Colors.grey.shade400),
                                    verticalSpace(0),
                                    HintBoldText(
                                      label: LocaleKeys.uploadPrescription.tr(),
                                      fontSize: 20.sp,
                                      labelColor: Colors.grey.shade400,
                                    )
                                  ],
                                ),
                        ),
                      ),
                    );
                  })),
              verticalSpace(20),
              BlackBoldText(label: LocaleKeys.note.tr(), fontSize: 16.sp),
              verticalSpace(8),
              CustomTextField(
                  contentHorizontalPadding: 16.w,
                  contentVerticalPadding: 16.h,
                  textInputAction: TextInputAction.done,
                  maxLines: 5,
                  hintText: LocaleKeys.note.tr(),
                  controller: _controller),
              verticalSpace(20),
              BlackBoldText(label: LocaleKeys.address.tr(), fontSize: 16.sp),
              verticalSpace(8),
              BlocConsumer<AddressCubit,AddressState>(
                builder: (BuildContext context ,AddressState state){
                  return
                    cubit.addressModel !=null?
                    cubit.addressModel!.data!.length==0?
                    Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35),
                      child: Column(
                        children: [
                          Center(child: Text(LocaleKeys.notFoundAddress.tr()),),
                          verticalSpace(10),
                          CustomElevatedButton(
                              backgroundColor: AppColors.whiteColor,
                              borderColor: AppColors.customGray,
                              fontColor: AppColors.primaryColor,
                              borderRadius: 8,
                              onTap: (){
                                context.pushNamed(RoutesRestaurants.addAddressScreen);
                              },
                              buttonText: LocaleKeys.addAddress.tr())
                        ],
                      ),
                    ):
                    Container(
                      // height: MediaQuery.of(context).size.height*0.3,
                      child: Column(
                        children: [
                          StatefulBuilder(builder: (context,setState){
                            addressId=cubit.addressModel!.data![0].id??0;
                            // currentMethod=addressId;
                            return  Column(
                              children: [
                                ...cubit.addressModel!.data!.map((data) =>  Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 10.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:AppColors.whiteColor,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              blurRadius: 2,
                                              offset: Offset(2,5)
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8.sp)
                                    ),
                                    child:
                                    Row(
                                      children: [
                                        Radio(
                                          activeColor:AppColors.primaryColor,
                                          value: data.id,
                                          groupValue: currentMethod,
                                          onChanged: (value) {
                                            setState(() {
                                              currentMethod = value!;
                                              addressId=data.id??0;
                                            });
                                          },
                                        ),
                                        Text(data.address!),
                                      ],
                                    ),
                                  ),
                                ))
                              ],
                            );

                          }),

                        ],
                      ),
                    ) :
                    Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2),
                      child: CustomLoadingWidget(),
                    );
                },
                listener: (BuildContext context ,AddressState state){},
              ),
              verticalSpace(40),
              BlocConsumer<PrescriptionCubit,PrescriptionState>(
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child:
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 2,
                                offset: Offset(2,8)
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.r)
                        ),
                        child: CustomElevatedButton(
                          isLoading: state is PrescriptionLoading,
                          loadingSize: 35,
                          width: double.infinity,
                          height: 50.h,
                          borderRadius: 12.r,
                          fontSize: 20.sp,
                          // borderColor: primaryColor,
                          //   backgroundColor: Colors.white,
                          //   fontColor: primaryColor,

                          onTap: () {
                            if (imageFile == null) {
                              showToast(
                                  text: LocaleKeys.uploadPrescription.tr(),
                                  state: ToastStates.error,
                                  context: context);
                              return;
                            }
                            context.read<PrescriptionCubit>().sendPrescription(
                                params: PrescriptionParams(
                                    brandId: branchId.toString(),
                                    addressId: addressId.toString(),
                                    storeId: storeId.toString(),
                                    prescription: imageFile,
                                    note: _controller.text,
                                ),
                                    context: context);
                          },
                          buttonText: LocaleKeys.send.tr(),
                        ),
                      )
                    );
                  },
                  listener: (context, state) {}),
              verticalSpace(100),
            ],
          ),
        ));
  }
}
