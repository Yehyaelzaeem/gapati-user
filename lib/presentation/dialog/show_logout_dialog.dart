

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/routing/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/locale_keys.g.dart';
import '../../domain/provider/local_auth_provider_cubit.dart';
import 'base/simple_dialogs.dart';

Future<bool?> showLogoutDialog(BuildContext context) async {

  return await showQuestionDialog(
    context,
    dialogType: DialogType.info,
    btnTextPositive: tr(LocaleKey2.no),
    btnTextNegative: tr(LocaleKey2.yes),
    question: 'Log Out',
    desc:'Are you sure you want to Log out?' ,
    // tr(LocaleKeys.wantToSignOut),
    onNegativeClick: () async{
    BlocProvider.of<LocalAuthCubit>(context, listen: false).logOut(context);
    },
    onPositiveClick: () {},
  );
}

Future<bool?> showDeleteAccountDialog(BuildContext context) async {

  return await showQuestionDialog(
    context,
    dialogType: DialogType.error,
    btnTextPositive: tr(LocaleKey2.no),
    btnTextNegative: tr(LocaleKey2.yes),
    question: 'Delete Account',
    desc:'Are you sure you want to Delete Account?' ,
    // tr(LocaleKeys.wantToSignOut),
    onNegativeClick: () {

    },
    onPositiveClick: () {},
  );
}

// _onLogoutPress(BuildContext context) {
//   BlocProvider.of<LocalAuthCubit>(context, listen: false).logOut().then((isLogOut) {
//     if (isLogOut) {
//       Navigator.pop(context);
//       NavigationService.pushNamedAndRemoveUntil(Routes.welcomeScreen);
//     }
//   });
