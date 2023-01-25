import 'package:flutter_modular/flutter_modular.dart';

import 'src/presenter/pages/Sign/sign.dart';
import 'src/presenter/pages/Home/home.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const SignPage()),
    ChildRoute('/home', child: (_, __) => const HomePage()),
  ];
}
