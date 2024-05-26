import 'package:cogina/presentation/component/custom_logo.dart';
import 'package:flutter/cupertino.dart';

import '../../core/assets_constant/images.dart';

class CustomIsUser extends StatelessWidget {
  const CustomIsUser({super.key, required this.isUser, required this.widget, this.hasLogo});
  final bool isUser;
  final bool? hasLogo;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return isUser==true?widget:
             hasLogo!=null?
                 // Container(
                 //   height: MediaQuery.of(context).size.height*0.2,
                 //   child: CustomLogo(),
                 // )
             Image.asset(RestaurantImages.logo2,
               height: MediaQuery.of(context).size.height*0.2,
             )
                 :
               SizedBox.shrink();
  }
}
