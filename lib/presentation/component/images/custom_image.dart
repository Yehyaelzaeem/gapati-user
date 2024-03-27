import 'package:flutter/cupertino.dart';

import '../../../core/assets_constant/images.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.image,  this.radius});
  final String image;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return  Image.network(
      image,
      fit: BoxFit.cover,
      errorBuilder: (context, error, v) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(radius??0),
          child: Image.asset(RestaurantImages.hol,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
