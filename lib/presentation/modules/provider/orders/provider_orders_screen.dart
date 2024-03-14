import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/modules/provider/orders/widgets/order_provider_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../component/custom_app_bar.dart';

class ProviderOrdersScreen extends StatelessWidget {
  const ProviderOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundGray,
      appBar: const CustomAppBar(
        color: AppColors.backGroundGray,
        title: 'الطلبات',
      ),
      body: SingleChildScrollView
        (
        child: Column(
          children: [
            OrderProviderItem(),
            verticalSpace(20),
            OrderProviderItem(),
            verticalSpace(20),
            OrderProviderItem(),
            verticalSpace(20),
            OrderProviderItem(),
          ],
        ),
      ),
    );
  }
}
