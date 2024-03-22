import 'package:coveverapp/config/http/http_manager.dart';
import 'package:coveverapp/features/home/data/data_sources/local/info_device_impl.dart';
import 'package:coveverapp/features/home/data/data_sources/remote/covid_info_impl_api.dart';
import 'package:coveverapp/features/home/data/repositories/covid_info_repository_impl.dart';
import 'package:coveverapp/features/home/data/repositories/info_device_repository_impl.dart';
import 'package:coveverapp/features/home/domain/usecases/covid_info_usecase.dart';
import 'package:coveverapp/features/home/domain/usecases/info_device_usecase.dart';

import 'package:coveverapp/features/login/data/data_sources/remote/auth_impl_api.dart';
import 'package:coveverapp/features/login/data/data_sources/remote/register_impl_api.dart';
import 'package:coveverapp/features/login/data/repositories/auth_respository_impl.dart';
import 'package:coveverapp/features/login/data/repositories/register_repository_impl.dart';
import 'package:coveverapp/features/login/domain/usecases/login_usecase.dart';
import 'package:coveverapp/features/login/domain/usecases/register_usecase.dart';
import 'package:coveverapp/features/states/data/data_sources/remote/info_state_impl_api.dart';
import 'package:coveverapp/features/states/data/repositories/info_state_repository_impl.dart';
import 'package:coveverapp/features/states/domain/usecases/info_state_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:coveverapp/features/login/presentation/pages/login_screen.dart'
    as login;
import 'package:coveverapp/features/home/presentation/pages/home_screen.dart'
    as home;
import 'package:coveverapp/features/login/presentation/pages/register_screen.dart'
    as register;
import 'package:coveverapp/main.dart' as main;
import 'package:coveverapp/features/login/presentation/pages/splash_screen.dart'
    as splash;
import 'package:coveverapp/features/states/presentation/pages/states_screen.dart'
    as states;

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HttpManager(), isLazy: false),
        Bind.singleton((_) => main.Bloc()),
        Bind.singleton((_) => AuthImplApi()),
        Bind.singleton((_) => AuthRepositoryImpl(Modular.get())),
        Bind.singleton((_) => LoginUseCase(Modular.get())),
        Bind.singleton((_) => login.Bloc(loginUseCase: Modular.get())),
        Bind.singleton((_) => RegisterImplApi()),
        Bind.singleton((_) => RegisterRepositiryImpl(Modular.get())),
        Bind.singleton((_) => RegisterUseCase(Modular.get())),
        Bind.singleton(
            (_) => register.RegisterBloc(registerUseCase: Modular.get())),
        Bind.singleton((_) => CovidInfoImplApi()),
        Bind.singleton((_) => CovidInfoRepositoryImpl(Modular.get())),
        Bind.singleton((_) => CovidInfoUseCase(Modular.get())),
        Bind.singleton((_) => InfoDeviceImpl()),
        Bind.singleton((_) => InfoDeviceRepositoryImpl(Modular.get())),
        Bind.singleton((_) => InfoDeviceUseCase(Modular.get())),
        Bind.singleton((_) => home.HomeBloc(
              covidInfoUseCase: Modular.get(),
              infoDeviceUseCase: Modular.get(),
            )),
        Bind.singleton((_) => InfoStateImpl()),
        Bind.singleton((_) => InfoStateRepositoryImpl(Modular.get())),
        Bind.singleton((_) => InfoStateUseCase(Modular.get())),
        Bind.singleton((_) => states.Bloc(infoStateUseCase: Modular.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const splash.SplasScreen(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/login',
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
        ChildRoute(
           '/States',
          child: (_, args) => const states.StateScreen(),
          transition: TransitionType.rightToLeft,
        ),
      ];
}
