import 'package:flutter_modular/flutter_modular.dart';

import 'src/core/http_client/http_client.dart';
import 'src/data/datasources/auth_datasource_implementation.dart';
import 'src/data/repositories/auth_repository_implementation.dart';
import 'src/domain/usecases/user_sign_in_usecase.dart';
import 'src/domain/usecases/user_sign_up_usecase.dart';
import 'src/presenter/bloc/sign_bloc/sign_bloc.dart';
import 'src/presenter/pages/Home/home.dart';
import 'src/presenter/pages/Sign/sign.dart';
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
        Bind.singleton(((i) => SignBloc(
              userSignInUsecase: i(),
              userSignUpUsecase: i(),
            ))),
        Bind.singleton((_) => client)
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(AppRoutes.sign.path, child: (_, __) => const SignPage()),
    ChildRoute(AppRoutes.home.path, child: (_, __) => const HomePage()),
  ];
}
