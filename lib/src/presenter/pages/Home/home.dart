import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../widgets/custom_bottom_tab_bar/custom_bottom_tab_bar.dart';
import 'components/circular_countdown_timer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: PomoColors.PRIMARY_WHITE,
        bottomNavigationBar: CustomBottomTabBar(),
        body: Column(
          children: <Widget>[
            CircularCountdownTimer(screenSize: screenSize),
          ],
        ),
      ),
    );
  }
}
