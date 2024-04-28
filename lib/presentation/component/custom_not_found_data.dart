import 'package:cogina/core/helpers/spacing.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/translations/locale_keys.dart';

class CustomNotFoundDataWidget extends StatelessWidget {
  const CustomNotFoundDataWidget({super.key, required  this.title, required this.type, required this.image});
  final String image;
  final String title;
  final String type;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        type=='png'?
        FittedBox(child: Image.asset(image)):
        FittedBox(child: SvgPicture.asset(image,)),
        verticalSpace(30),
        Text('${title}',
            style: TextStyles.font18Black700Weight.copyWith(
                color: AppColors.customBlack.withOpacity(0.6)
            )
        )
      ],
    );
  }
}
