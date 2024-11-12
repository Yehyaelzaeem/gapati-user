import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/global/styles/colors.dart';
import '../../core/resources/color.dart';

class CustomLoadingWidget extends StatelessWidget {
  final Color? color;
  final double? size;
  const CustomLoadingWidget({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return   SpinKitCircle(
      color:color?? AppColors.primaryColor,
      size: size??50.0,
    );
  }
}
