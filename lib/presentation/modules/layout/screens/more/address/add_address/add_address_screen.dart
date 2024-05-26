import 'package:cogina/core/helpers/spacing.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../../../component/custom_app_bar.dart';
import '../../../cart/widgets/custom_address_widget.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:    CustomAppBar(
        title: LocaleKeys.address.tr(),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(30),
               CustomAddressWidget(buttonTitle: LocaleKeys.add.tr(),pop: true,),
            ],
          ),
        ),
      ),
    );
  }
}
