import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../widgets/text/custom_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: PomoColors.PRIMARY_RED,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: "Analytics",
          ),
        ],
      ),
      body: Container(
        color: PomoColors.PRIMARY_WHITE,
        child: const CustomText("Hícaro"),
      ),
    );
  }
}
