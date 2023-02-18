enum AppRoutes { home, sign }

extension AppRoutesUtils on AppRoutes {
  String get path {
    final path = {
      AppRoutes.sign: "/",
      AppRoutes.home: "/home",
    };

    return path[this]!;
  }
}
