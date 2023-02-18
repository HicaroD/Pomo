import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../widgets/custom_bottom_tab_bar/custom_bottom_tab_bar.dart';
import '../../widgets/text/custom_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: PomoColors.PRIMARY_WHITE,
        bottomNavigationBar: CustomBottomTabBar(),
        body: Column(
          children: const <Widget>[
            CustomText("Hícaro"),
          ],
        ),
      ),
    );
  }
}
