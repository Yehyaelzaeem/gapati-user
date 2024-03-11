import 'package:flutter/material.dart';
import '../meal_details_screen.dart';
import 'custom_meal_widget.dart';

class CustomBestMealsWidget extends StatelessWidget {
  const CustomBestMealsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context,index){
      return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const MealDetailsScreen()));
          },
          child: const CustomMealWidget());
    });
  }
}
