import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../component/custom_app_bar.dart';
import '../layout/screens/favorite/widgets/custom_favorite_item.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Offers',
        ),
        body:   GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 9.w,
            mainAxisSpacing: 15.h,
            mainAxisExtent: 200.h,
          ),
          itemBuilder: (BuildContext context, int index) {
            return CustomFavoriteItem(isOffer: true,);
          },
          shrinkWrap: true,
          itemCount: 10,
          padding: EdgeInsets.all(16.w),
        )
    );
  }
}
