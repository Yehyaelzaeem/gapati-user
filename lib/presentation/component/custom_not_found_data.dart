import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../core/helpers/spacing.dart';

class CustomNotFoundDataWidget extends StatelessWidget {
  const CustomNotFoundDataWidget({super.key, required  this.title, required this.type, required this.image});
  final String image;
  final String title;
  final String type;
  @override
  Widget build(BuildContext context) {
    return
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        type=='png'?
        Expanded(child: Image.asset(image)):
        Expanded(child: SvgPicture.asset(image,)),
        Text('${title}',
            style: TextStyles.font18Black700Weight.copyWith(
                color: AppColors.customBlack.withOpacity(0.6)
            ),
        ),
        verticalSpace(100),
      ],
    );
  }
}
