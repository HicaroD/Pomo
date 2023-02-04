import 'package:flutter_modular/flutter_modular.dart';

import 'src/features/presenter/pages/Sign/sign.dart';
import 'src/features/presenter/pages/Home/home.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const SignPage()),
    ChildRoute('/home', child: (_, __) => const HomePage()),
  ];
}
