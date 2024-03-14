import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/modules/provider/elements/widgets/custom_element_item.dart';
import 'package:flutter/material.dart';
import '../../../component/custom_app_bar.dart';

class ElementsScreen extends StatelessWidget {
  const ElementsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.backGroundGray,
      appBar: const CustomAppBar(
        color: AppColors.backGroundGray,
        title: 'العناصر',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomElementsItem(),
            verticalSpace(20),
            CustomElementsItem(),
            verticalSpace(20),
            CustomElementsItem(),
            verticalSpace(20),
            CustomElementsItem(),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
