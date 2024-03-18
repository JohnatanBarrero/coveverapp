import 'package:coveverapp/config/http/http_manager.dart';
import 'package:coveverapp/features/login/data/data_sources/remote/auth_impl_api.dart';
import 'package:coveverapp/features/login/data/repositories/auth_respository_impl.dart';
import 'package:coveverapp/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:coveverapp/features/login/presentation/pages/login_screen.dart'
    as login;

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HttpManager(), isLazy: false),
        Bind.singleton((_) => AuthImplApi()),
        Bind.singleton((_) => AuthRepositoryImpl(Modular.get())),
        Bind.singleton((_) => LoginUseCase(Modular.get())),
        Bind.singleton((_) => login.Bloc(loginUseCase: Modular.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) =>  login.LoginScreen(),
        ),

        //   Modular.initialRoute,
        //   child: (_, args) => const init.PageTest(),
        // ),
      ];
}
