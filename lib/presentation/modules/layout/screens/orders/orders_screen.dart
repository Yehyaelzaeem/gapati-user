import 'package:cogina/core/assets_constant/images.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/modules/layout/screens/orders/widgets/custom_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/custom_app_bar.dart';
import '../../layout_cubit.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   CustomAppBar(
        title: 'Orders',
        onBackPress: (){
          final LayoutCubit viewModel = BlocProvider.of<LayoutCubit>(context);
          viewModel.setCurrentIndex(0);
        },
      ),
      body:   Container(
        color: AppColors.customWhite,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              verticalSpace(20),
              const CustomOrderItemWidget(),
              const CustomOrderItemWidget(),
              const CustomOrderItemWidget(),
            ],
          ),
        ),
      )
    );
  }
}
