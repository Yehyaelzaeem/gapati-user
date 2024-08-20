
import 'package:delivego/core/helpers/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/global/styles/colors.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../../../../data/model/response/address_model.dart';
import '../../../../../../../domain/request_body/address_body.dart';
import '../../../../../../component/custom_elevated_button.dart';
import '../address_cubit.dart';

class CustomExpansionTileWidget extends StatefulWidget {
  const CustomExpansionTileWidget({super.key, required this.addressModelData});
  final AddressModelData addressModelData;

  @override
  State<CustomExpansionTileWidget> createState() => _CustomExpansionTileWidgetState();
}

class _CustomExpansionTileWidgetState extends State<CustomExpansionTileWidget> {
  TextEditingController _addressController =TextEditingController();
  TextEditingController _phoneController =TextEditingController();
  TextEditingController _locationController =TextEditingController();
  @override
  void initState() {
    _addressController=TextEditingController(text: widget.addressModelData.address??'' );
    _phoneController=TextEditingController(text: widget.addressModelData.phone??'' );
    _locationController=TextEditingController(text: '${widget.addressModelData.lat}/${widget.addressModelData.lng}'??'' );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AddressCubit cubit =AddressCubit.get(context);
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8.sp)
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: BlocConsumer<AddressCubit, AddressState>(
            listener: (BuildContext context,AddressState state) {},
            builder: (BuildContext context,AddressState state) {
          return ExpansionTile(
              childrenPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              textColor: Colors.black,
              collapsedTextColor: Colors.black,
              title: Text('${widget.addressModelData.address}',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold)),
              children: <Widget>[
                Text(
                  LocaleKeys.phone.tr(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
                TextField(
                    controller:_phoneController,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: Color(0xff4B4B4B)))),
                SizedBox(height: 25.h),
                Text(
                  LocaleKeys.address.tr(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
                TextField(
                   controller:_addressController ,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: Color(0xff4B4B4B)))),
                SizedBox(height: 25.h),
                Text(
                  LocaleKeys.location.tr(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: (){
                    widget.addressModelData.lat!=null&&widget.addressModelData.lng!=null?
                    context.pushNamed(RoutesRestaurants.customGoogleMapScreen,
                        arguments: {'lat':double.parse(widget.addressModelData.lat!),'long':double.parse(widget.addressModelData.lng!)}
                    ):null;
                  },
                  child: TextField(
                    controller: _locationController,
                      enabled: false,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Color(0xff4B4B4B)))),
                ),
                SizedBox(height: 25.h),
                CustomElevatedButton(
                    isLoading: state is UpdateAddressLoadingState,
                    width: double.infinity,
                    height: 40.h,
                    onTap: (){
                      AddressBody addressBody=
                      AddressBody(addressNote: 'note update', address: _addressController.text, latitude: cubit.lat.toString()??'00', longitude: cubit.long.toString()??'00', phone: _phoneController.text);
                      cubit.updateAddress(addressId: widget.addressModelData.id!, addressBody: addressBody, context: context);
                    },
                    buttonText: LocaleKeys.update.tr()),
                CustomElevatedButton(
                  isLoading: state is DeleteAddressLoadingState,
                   loadingColor: AppColors.primaryColor,
                   backgroundColor: Colors.transparent,
                    fontColor: AppColors.customGray,
                    borderColor: AppColors.customGray,
                    width: double.infinity,
                    height: 40.h,
                    onTap: (){
                      cubit.deleteAddress(addressId: widget.addressModelData.id!);
                    },
                    buttonText: LocaleKeys.delete.tr())
              ]);
            },
          ),
        ),
      ),
    );
  }
}
