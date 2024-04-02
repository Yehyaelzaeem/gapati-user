import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'custom_logo_restuarant.dart';
import 'custom_product_item_shimmer.dart';
class OffersShimmerWidget extends StatelessWidget {
  const OffersShimmerWidget({Key? key, this.height}) : super(key: key);
  final double? height;
  @override
  Widget build(BuildContext context) {
    return const Column(
            children: [
              FittedBox(
                child: Row(
                  children: [
                    CustomProductItemShimmer(),
                    CustomProductItemShimmer()
                  ],
                ),
              ),
              FittedBox(
                child: Row(
                  children: [
                    CustomProductItemShimmer(),
                    CustomProductItemShimmer()
                  ],
                ),
              ),
            ],
          );
  }
}