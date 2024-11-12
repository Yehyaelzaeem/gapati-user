

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:delivego/core/helpers/extensions.dart';
import 'package:delivego/presentation/modules/layout/screens/cart/cart_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../generated/locale_keys.g.dart';
import '../../core/assets_constant/images.dart';
import '../../core/global/styles/colors.dart';
import '../../core/global/styles/styles.dart';
import '../../core/helpers/spacing.dart';
import '../../core/routing/routes.dart';
import '../../domain/provider/local_auth_provider_cubit.dart';
import '../component/custom_elevated_button.dart';
import '../modules/auth/login/login_cubit.dart';
import 'base/simple_dialogs.dart';

Future<bool?> showChangeDefaultAddressDialog(BuildContext context,void Function()? onNegativeClick) async {

  return await showQuestionDialog(
    context,
    dialogType: DialogType.warning,
    btnTextPositive: LocaleKeys.no.tr(),
    btnTextNegative: LocaleKeys.yes.tr(),
    question: LocaleKeys.defaultAddress.tr(),
    desc:LocaleKeys.cartWillBeEmpty2.tr() ,
    onNegativeClick: onNegativeClick??() async{
    BlocProvider.of<CartCubit>(context, listen: false).removeAll();
    },
    onPositiveClick: () {},
  );
}

