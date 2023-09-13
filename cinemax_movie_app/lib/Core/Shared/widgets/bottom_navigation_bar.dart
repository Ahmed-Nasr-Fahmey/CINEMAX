import 'package:flutter/material.dart';


class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});
  static const String routeName = 'BottomNavigatorBar';
  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  final List<Widget> mainScreensList = const [];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
