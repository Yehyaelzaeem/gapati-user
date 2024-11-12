import 'package:delivego/presentation/component/texts/black_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateWidget extends StatelessWidget {
  final num? initialRating;
  final ValueChanged<double>? onRatingUpdate;
  final bool ignoreGestures;
  final double iconSize;
  final Color? filledColor;
  final Color? emptyColor;
  final IconData? filledIcon;
  final IconData? halfFilledIcon;
  final IconData? emptyIcon;

   RateWidget({
    Key? key,
    this.initialRating,
    this.onRatingUpdate,
    this.ignoreGestures = true,
    this.iconSize = 15,
    this.filledColor = Colors.amber,
    this.emptyColor = Colors.grey,
    this.filledIcon = Icons.star_outlined,
    this.halfFilledIcon = Icons.star_half,
    this.emptyIcon = Icons.star_border,
  }) : super(key: key);
  double rate2 = 0;
  @override
  Widget build(BuildContext context) {
    rate2=double.parse(initialRating?.toString()??'0');
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingBar(
            initialRating: (initialRating ?? 3).toDouble(),
            itemSize: iconSize,
            minRating: 1,
            ignoreGestures: ignoreGestures,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            onRatingUpdate: (double rate) {
              rate2 = rate;
              onRatingUpdate!(rate);
              setState(() {});
            },
            ratingWidget: RatingWidget(
              full: Icon(filledIcon, size: iconSize, color: filledColor),
              half: Icon(halfFilledIcon, size: iconSize, color: filledColor),
              empty: Icon(emptyIcon, size: iconSize, color: emptyColor),
            ),
          ),
          BlackMediumText(label: ' ${rate2.toString()} '+' Star Ratings ',labelColor: Color(0xffFF9D00),fontSize: 11.sp,),
        ],
      );
    });
  }
}
