import 'package:cogina/presentation/component/component.dart';
import 'package:cogina/presentation/modules/user/restaurant/widgets/custom_restaurant_widget.dart';
import 'package:flutter/material.dart';

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(
        title: 'All Restaurants',
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
        return const CustomRestaurantWidget();
      })
    );
  }
}
