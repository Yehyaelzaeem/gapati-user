
import 'package:delivego/core/resources/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../component/spaces.dart';

class PagePopup extends StatelessWidget {
  final PageViewData imageData;

  const PagePopup({Key? key, required this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: <Widget>[
        SizedBox(
          height: deviceHeight / 2,
          child: SizedBox(
            width: deviceWidth,
            child: AspectRatio(aspectRatio: 1, child: Image.asset(imageData.assetsImage, fit: BoxFit.cover,),),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius:const BorderRadius.vertical(top: Radius.circular(kFormRadiusLarge))),
            height: deviceHeight / 3,
            child: Padding(
              padding: EdgeInsets.all(kScreenPaddingNormal.r),
              child: Column(
                children: [
                  VerticalSpace(kScreenPaddingLarge.h),
                  Text(
                    tr(imageData.titleText),
                    textAlign: TextAlign.center,
                    style: const TextStyle().titleStyle(fontSize: 28).customColor(const Color(0xffFE8270)),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Center(
                        child: Text(
                          tr(imageData.subText),
                          textAlign: TextAlign.justify,
                          style: TextStyles.font18Black700Weight.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.customGray
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PageViewData {
  final String _titleText;
  final String _subText;
  final String _assetsImage;

  const PageViewData({
    required String titleText,
    required String subText,
    required String assetsImage,
  })  : _titleText = titleText,
        _subText = subText,
        _assetsImage = assetsImage;


  String get assetsImage => _assetsImage;

  String get subText => _subText;

  String get titleText => _titleText;
}