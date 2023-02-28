import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class CustomBottomTabBar extends StatelessWidget {
  CustomBottomTabBar({Key? key}) : super(key: key);

  final tabs = [
    const Tab(icon: Icon(Icons.home)),
    const Tab(icon: Icon(Icons.analytics)),
    const Tab(icon: Icon(Icons.person)),
    const Tab(icon: Icon(Icons.settings)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: PomoColors.PRIMARY_RED,
      ),
      child: TabBar(
        indicator: const BoxDecoration(),
        tabs: tabs,
      ),
    );
  }
}
