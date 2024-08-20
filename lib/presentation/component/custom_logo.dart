import 'package:flutter/material.dart';

import '../../core/global/fonts/app_fonts.dart';
import '../../core/global/styles/colors.dart';
import '../../core/global/styles/styles.dart';

class CustomLogo extends StatelessWidget {
  CustomLogo();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('LOGO',style: TextStyles.font20Black700Weight.copyWith(
        fontFamily: AppFonts.lateefFont,
        color: AppColors.primaryColor,
        fontSize: 50
    ),));
  }

}
