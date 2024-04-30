import 'package:flutter/material.dart';

@immutable
class NavigationTab {
  const NavigationTab({
    required this.name,
    required this.image,
    required this.selectIcon,
    required this.unSelectIcon,
    required this.initialRoute,
    required this.index,
  });
  final String name;
  final Widget selectIcon;
  final Widget unSelectIcon;
  final String image;
  final Widget initialRoute;
  final int index;
}
