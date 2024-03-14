import 'package:cogina/presentation/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../component/custom_app_contant_data.dart';


class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(
        title: 'Terms And Condition',
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        child: const CustomAppContData(image: '', title: 'McDonald\'s', des:
        ''' As of my last update in January 2022, McDonald's is a globally recognized fast-food restaurant chain known for its hamburgers, cheeseburgers, French fries, and other fast-food items. Here are some general points about McDonald's:

1. **History**: McDonald's was founded in 1940 by Richard and Maurice McDonald in San Bernardino, California, USA. It has since grown into one of the largest and most recognizable fast-food chains in the world.

2. **Menu**: McDonald's menu typically includes a variety of burgers, chicken sandwiches, salads, breakfast items, fries, desserts, and beverages. The exact menu offerings may vary by location and country to cater to local preferences.

3. **Global Presence**: McDonald's operates in over 100 countries and serves millions of customers each day. It has a vast network of franchisees and company-owned restaurants worldwide.

4. **Innovation**: Over the years, McDonald's has been known for its innovative marketing campaigns, menu additions, and restaurant designs. It has also made efforts to adapt to changing consumer preferences by introducing healthier menu options and sustainability initiatives.

5. **Community Engagement**: McDonald's is involved in various community outreach programs and charitable initiatives. It often supports local communities through sponsorships, scholarships, and partnerships with nonprofit organizations.

6. **Employment**: McDonald's is one of the largest employers globally, providing job opportunities to people across different age groups and backgrounds. It offers training programs and career development opportunities for its employees.

Please note that while these points provide a general overview of McDonald's, specific information may have changed since my last update. For the most accurate and up-to-date information about McDonald's, including menu items, promotions, and company initiatives, I recommend visiting the official McDonald's website or contacting their customer service directly.''',),
      )
    );
  }
}
