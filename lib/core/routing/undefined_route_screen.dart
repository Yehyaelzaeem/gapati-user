
import 'package:delivego/core/resources/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import '../../generated/locale_keys.g.dart';

class UndefinedRouteScreen extends StatelessWidget {
  const UndefinedRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child:Text(tr(LocaleKeys.notFoundData),style: const TextStyle().titleStyle(),) ,
        ),
    );
  }
}
