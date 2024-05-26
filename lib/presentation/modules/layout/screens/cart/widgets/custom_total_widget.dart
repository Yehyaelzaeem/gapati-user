import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/locale_keys.g.dart';
import '../cart_cubit.dart';


class CustomTotalWidget extends StatelessWidget {
  const CustomTotalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CartCubit cubit = CartCubit.get(context);
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(LocaleKeys.totalAmount.tr(),
                style: TextStyles.font16Black600Weight.copyWith(
                    fontWeight: FontWeight.bold
                ),),
              const Spacer(),
              Text( '${cubit.totalPrice().toStringAsFixed(1)} ${LocaleKeys.lyd.tr()}',
                style: TextStyles.font16Black600Weight.copyWith(
                    color: AppColors.redColor.withOpacity(0.6)
                ),
              ),
              SizedBox(width: 10.w,),
            ],
          ),
        );
      },
    );
  }
}
