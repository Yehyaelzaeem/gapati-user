import 'package:flutter/material.dart';

class NearestScreen extends StatefulWidget {
const NearestScreen({Key? key}) : super(key: key);

@override
_NearestScreenState createState() => _NearestScreenState();
}

class _NearestScreenState extends State<NearestScreen> with SingleTickerProviderStateMixin {
AnimationController _controller;

@override
void initState() {
_controller = AnimationController(vsync: this);
super.initState();
}

@override
void dispose() {
_controller.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Container();
}
}
