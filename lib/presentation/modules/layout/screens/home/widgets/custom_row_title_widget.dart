import 'package:delivego/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../component/texts/black_texts.dart';

class CustomRowTitleWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final String? image;
  final Function()? onTap;
  final int? length;
  const CustomRowTitleWidget({Key? key, required this.title,  this.icon,this.image, this.onTap, this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      length!=null && length!>0?
      Row(
      children: [
        image!=null?
        Image.asset(image!,width: 30,height: 30,):
        Icon(icon,color: Colors.grey,),
        horizontalSpace(2),
        Expanded(child: BlackBoldText(label: title,fontSize: 16,),),
        if(length!=null && length! > 3)
        InkWell(
          onTap: onTap,
          child:   BlackRegularText(label: LocaleKeys.seeAll.tr(),fontSize: 12,),
        )
      ],
    ):
    SizedBox.shrink()
    ;
  }
}
