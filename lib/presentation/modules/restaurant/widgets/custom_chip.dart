import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

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
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            label.substring(0, 1).toUpperCase(),
            style: TextStyles.font18Black700Weight.copyWith(
              color: Colors.white
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
