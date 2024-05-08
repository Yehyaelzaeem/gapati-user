import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/global/styles/colors.dart';
import '../../core/resources/color.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   SpinKitCircle(
      color: AppColors.primaryColor,
      size: 50.0,
    );
  }
}
