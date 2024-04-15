import 'package:cogina/presentation/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/custom_app_contant_data.dart';


class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(
        title: 'About Us',
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        child: const CustomAppContData(image: '', title: 'McDonald\'s', des:
        ''' As of my last update in January 2022, McDonald's is a multinational fast-food restaurant chain known for its hamburgers, cheeseburgers, and French fries. The company was founded in 1940 by Richard and Maurice McDonald in San Bernardino, California, USA. 
McDonald's has a diverse menu that includes various items such as:
1. **Burgers**: They offer a range of burgers including the classic Big Mac, Quarter Pounder with Cheese, and the McDouble.

2. **Chicken**: Chicken McNuggets, McChicken sandwich, and various grilled or crispy chicken options are available.

3. **Fries and Sides**: McDonald's is famous for its French fries, often available in different sizes. Additionally, they offer items like salads, apple slices, and yogurt.

4. **Breakfast Items**: McDonald's serves breakfast items such as Egg McMuffins, sausage burritos, and hotcakes.

5. **Beverages**: McDonald's offers a variety of beverages including soft drinks, coffee, tea, milkshakes, and smoothies.

6. **Desserts**: McDonald's dessert menu includes items like apple pies, ice cream cones, and McFlurry desserts with various toppings.

7. **Happy Meal**: A kids' meal option that typically includes a choice of a burger or chicken nuggets, fries, a drink, and a toy.

Please note that menu offerings may vary by location and over time, as McDonald's periodically introduces new items and promotional offers in different regions. For the most accurate and up-to-date information, it's best to check McDonald's official website or inquire at your local restaurant.''',),
      )
    );
  }
}
