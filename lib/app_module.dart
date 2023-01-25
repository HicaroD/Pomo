import 'package:flutter_modular/flutter_modular.dart';
import 'package:pomo_app/src/presenter/pages/Home/home.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const Home()),
  ];
}
