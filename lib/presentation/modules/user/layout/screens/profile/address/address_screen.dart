import 'package:cogina/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../component/custom_app_bar.dart';
import '../../cart/widgets/custom_address_widget.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:   const CustomAppBar(
        title: 'Address',
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            verticalSpace(30),
            const CustomAddressWidget(buttonTitle: 'Finished',),
          ],
        ),
      ),
    );
  }
}
