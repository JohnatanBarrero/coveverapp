import 'package:coveverapp/config/http/http_manager.dart';
import 'package:coveverapp/features/login/data/data_sources/remote/auth_impl_api.dart';
import 'package:coveverapp/features/login/data/data_sources/remote/register_impl_api.dart';
import 'package:coveverapp/features/login/data/repositories/auth_respository_impl.dart';
import 'package:coveverapp/features/login/data/repositories/register_repository_impl.dart';
import 'package:coveverapp/features/login/domain/usecases/login_usecase.dart';
import 'package:coveverapp/features/login/domain/usecases/register_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:coveverapp/features/login/presentation/pages/login_screen.dart'
    as login;
import 'package:coveverapp/features/home/presentation/page/home_screen.dart'
    as home;
import 'package:coveverapp/features/login/presentation/pages/register_screen.dart'
    as register;

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HttpManager(), isLazy: false),
        Bind.singleton((_) => AuthImplApi()),
        Bind.singleton((_) => AuthRepositoryImpl(Modular.get())),
        Bind.singleton((_) => LoginUseCase(Modular.get())),
        Bind.singleton((_) => login.Bloc(loginUseCase: Modular.get())),
        Bind.singleton((_) => RegisterImplApi()),
        Bind.singleton((_) => RegisterRepositiryImpl(Modular.get())),
        Bind.singleton((_) => RegisterUseCase(Modular.get())),
        Bind.singleton(
            (_) => register.RegisterBloc(registerUseCase: Modular.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => login.LoginScreen(),
        ),
        ChildRoute(
          '/Home',
          child: (_, args) => const home.HomeScreen(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/Register',
          child: (_, args) => const register.RegisterScreen(),
          transition: TransitionType.rightToLeft,
        ),
      ];
}
