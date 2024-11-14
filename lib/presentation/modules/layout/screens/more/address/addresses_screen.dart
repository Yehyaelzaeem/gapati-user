import 'package:delivego/core/helpers/extensions.dart';
import 'package:delivego/data/model/response/address_model.dart';

import '../../../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/fonts/app_fonts.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/resources/color.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../component/custom_app_bar.dart';
import '../../../../../component/custom_loading_widget.dart';
import '../../../../../dialog/change_defult_address.dart';
import 'address_cubit.dart';
import 'widgets/custom_expansiontile_widget.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  void initState() {
    AddressCubit.get(context).getLocation(context);
    AddressCubit.get(context).getAllAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AddressCubit cubit = AddressCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: LocaleKeys.addresses.tr(),
        actions: [
          IconButton(
              onPressed: () {
                cubit.getLocation(context);
                context.pushNamed(RoutesRestaurants.addAddressScreen);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BlocConsumer<AddressCubit, AddressState>(
            builder: (BuildContext context, AddressState state) {
              return cubit.addressModel != null
                  ? Column(
                      children: <Widget>[
                        cubit.addressModel!.data!.length == 0
                            ? Padding(
                                padding: EdgeInsets.only(top: 50.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(AppImages.location),
                                    Center(
                                      child: Text(
                                        LocaleKeys.notFoundData.tr(),
                                        style: TextStyles.font20Black700Weight
                                            .copyWith(
                                                fontFamily: AppFonts.lateefFont,
                                                fontSize: 30),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 8.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade50,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black38,
                                              blurRadius: 1,
                                              // offset: Offset(2, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.sp)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                                        child: BlocConsumer<AddressCubit,
                                            AddressState>(
                                          listener: (BuildContext context,
                                              AddressState state) {},
                                          builder: (BuildContext context,
                                              AddressState state) {
                                            return
                                              Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Radio<String>(
                                                  value: '0',
                                                  groupValue: cubit.selectedAddressValue,
                                                  onChanged: (String? newValue) {
                                                    print('newValue $newValue');
                                                    if(newValue!=null){
                                                      // showChangeDefaultAddressDialog(context,
                                                      //         (){
                                                      //           cubit.getLocation(context).then((value) {
                                                      //             cubit.changeSelectedAddress(AddressModelData(
                                                      //               id: 0,
                                                      //               lat: value.latitude.toString()??'0.0',
                                                      //               lng: value.longitude.toString()??'0.0',
                                                      //               address: cubit.addressTitle??'',
                                                      //               phone: '',
                                                      //               addressToNote: '',
                                                      //
                                                      //             ),context);
                                                      //           });
                                                      //     }
                                                      // );
                                                      cubit.getLocation(context).then((value) {
                                                        cubit.changeSelectedAddress(AddressModelData(
                                                          id: 0,
                                                          lat: value.latitude.toString()??'0.0',
                                                          lng: value.longitude.toString()??'0.0',
                                                          address: cubit.addressTitle??'',
                                                          phone: '',
                                                          addressToNote: '',

                                                        ),context);
                                                      });

                                                    }
                                                  },
                                                ),
                                                Text('${LocaleKeys.currentLocation.tr()}',
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight: FontWeight.bold)),

                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CustomExpansionTileWidget(
                                        addressModelData:
                                            cubit.addressModel!.data![index],
                                      );
                                    },
                                    itemCount: cubit.addressModel!.data!.length,
                                    shrinkWrap: true,
                                  ),
                                ],
                              )
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.35),
                      child: CustomLoadingWidget(),
                    );
            },
            listener: (BuildContext context, AddressState state) {},
          )),
    );
  }
}
