import 'package:flutter_modular/flutter_modular.dart';

import 'src/core/http_client/http_client.dart';
import 'src/features/data/datasources/auth_datasource_implementation.dart';
import 'src/features/data/repositories/auth_repository_implementation.dart';
import 'src/features/domain/usecases/user_sign_in_usecase.dart';
import 'src/features/domain/usecases/user_sign_up_usecase.dart';
import 'src/features/presenter/bloc/sign_bloc/sign_bloc.dart';
import 'src/features/presenter/pages/Sign/sign.dart';
import 'src/features/presenter/pages/Home/home.dart';
import 'src/utils/api_endpoints.dart';
import 'src/utils/app_routes.dart';

class AppModule extends Module {
  final client = HttpClient(baseUrl: BASE_URL);

  @override
  List<Bind> get binds => [
        Bind.singleton(((i) => UserSignInUsecase(i()))),
        Bind.singleton(((i) => UserSignUpUsecase(i()))),
        Bind.singleton(((i) => AuthDatasourceImpl(i()))),
        Bind.singleton(((i) => AuthRepositoryImpl(i()))),
        Bind.singleton(((i) => SignBloc())),
        Bind.singleton((_) => client)
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(AppRoutes.sign.path, child: (_, __) => const SignPage()),
    ChildRoute(AppRoutes.home.path, child: (_, __) => const HomePage()),
  ];
}
