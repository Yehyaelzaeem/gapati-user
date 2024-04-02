import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../component/custom_app_bar.dart';
import '../layout/screens/favorite/widgets/custom_favorite_item.dart';
import '../layout/screens/home/home_cubit.dart';
import '../layout/screens/home/widgets/offers_widgets.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(
          title: 'Offers',
        ),
        body:
        OffersWidget(),
    );
  }
}
