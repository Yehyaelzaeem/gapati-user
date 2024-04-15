import 'package:cogina/presentation/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/custom_app_contant_data.dart';



class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(
        title: 'Privacy Policy',
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        child: const CustomAppContData(image: '', title: 'McDonald\'s', des:
        '''As of my last knowledge update in January 2022, I don't have specific details on McDonald's terms and conditions. For the most accurate and up-to-date information, I recommend checking McDonald's official website or contacting their customer service directly.

You can usually find terms and conditions, as well as other legal information, in the footer of the official website. Look for links such as "Terms and Conditions," "Legal," or "Privacy Policy."

If you have a specific question or concern, reaching out to McDonald's customer support or visiting their official website would be the best way to obtain the most current and accurate information. Keep in mind that terms and conditions may be subject to change, so it's important to refer to the latest documents provided by McDonald's.''',),
      )
    );
  }
}
