import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/services.dart';

import 'src/utils/colors.dart';
import 'app_module.dart';
import 'app_widget.dart';

void main() {
  runApp(const PomoApp());
}

class PomoApp extends StatelessWidget {
  const PomoApp({Key? key}) : super(key: key);

  void _preconfigureApp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: PomoColors.PRIMARY_RED,
        systemNavigationBarColor: PomoColors.PRIMARY_RED,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _preconfigureApp();

    return ModularApp(
      module: AppModule(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.translucent,
        child: const AppWidget(),
      ),
    );
  }
}
