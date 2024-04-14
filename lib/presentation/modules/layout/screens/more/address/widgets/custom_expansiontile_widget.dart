import 'package:cogina/presentation/modules/layout/screens/more/address/address_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/translations/locale_keys.dart';
import '../../../../../../../data/model/response/address_model.dart';

class CustomExpansionTileWidget extends StatelessWidget {
  const CustomExpansionTileWidget({super.key, required this.addressModelData});
  final AddressModelData addressModelData;
  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10.sp)
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
              title: Text('${addressModelData.addressTo}',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold)),
              children: <Widget>[
                Text(
                  'Type',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
                TextField(
                    enabled: false,
                    // controller:cubit.addressNameController ,
                    decoration: InputDecoration(
                        hintText: '${addressModelData.addressType==0?LocaleKeys.myHomeAddress.tr():
                        addressModelData.addressType==1?LocaleKeys.workAddress.tr():LocaleKeys.otherAddress.tr()}',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: Color(0xff4B4B4B)))),
                SizedBox(height: 25.h),
                Text(
                  'Address',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
                TextField(
                  enabled: false,
                  // controller:cubit.addressNameController ,
                    decoration: InputDecoration(
                        hintText: '${addressModelData.addressTo}',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: Color(0xff4B4B4B)))),
                SizedBox(height: 25.h),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
