
import 'package:flutter/material.dart';

import '../../../../core/global/styles/styles.dart';

class OutlinedChip extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? avatarBackgroundColor;
  final String price;
  final double? borderRadius; // New property for border radius

   const OutlinedChip({
    Key? key,
    required this.label,
    this.backgroundColor ,
    this.avatarBackgroundColor ,
    required this.price,
    this.borderRadius, // Default border radius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      side:  BorderSide(color: backgroundColor??Colors.blue.shade100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius??50), // Applying border radius
      ),
      avatar: CircleAvatar(
        backgroundColor: avatarBackgroundColor??Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              // label.substring(0, 1).toUpperCase(),
              double.parse(price.toString()).toStringAsFixed(1),
              style: TextStyles.font18Black700Weight.copyWith(
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
      backgroundColor: backgroundColor??Colors.blue[100],
      label:
      Text(label,
          style: TextStyles.font18Black700Weight
      ),
    );
  }
}
