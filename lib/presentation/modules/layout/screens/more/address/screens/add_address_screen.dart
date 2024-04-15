import 'package:cogina/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../component/custom_app_bar.dart';
import '../../../cart/widgets/custom_address_widget.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

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
            const CustomAddressWidget(buttonTitle: 'Add',pop: true,),
          ],
        ),
      ),
    );
  }
}
