import 'package:coveverapp/config/http/http_manager.dart';
import 'package:coveverapp/config/module.dart';
import 'package:coveverapp/config/prefs/preferences.dart';

import 'package:coveverapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:coveverapp/features/login/presentation/blocs/bloc/bloc.dart'
    as bloc_login;

import 'package:coveverapp/config/main/bloc/bloc.dart' as main_bloc;
export 'package:coveverapp/config/main/bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = Preferences();
  await prefs.initPrefs();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.get<HttpManager>().init(
      urlBase: 'https://api.covidtracking.com/v1/',
    );

    final bloc_login.Bloc blocLogin = Modular.get();
    blocLogin.add(
      bloc_login.LoadInitialEvent(),
    );

    final main_bloc.Bloc mainBloc = Modular.get();
    mainBloc.add(
      main_bloc.LoadInitialEvent(),
    );

    return BlocProvider.value(
      value: Modular.get<main_bloc.Bloc>(),
      child: BlocBuilder<main_bloc.Bloc, main_bloc.State>(
        builder: (context, state) {
          return MaterialApp.router(
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
            title: 'Prixz',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale.fromSubtags(languageCode: 'es')],
            theme: state.model.isDarkThemeApp
                ? ThemeData(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    primaryColor: const Color(0xFFED8429),
                    cardTheme: const CardTheme(color: Colors.white),
                    colorScheme: const ColorScheme(
                      secondaryContainer: Color(0xFF525659) ,
                      primaryContainer: Colors.white,
                      brightness: Brightness.light,
                      primary: Color(0xFFED8429),
                      onPrimary: Color(0xFF525659),
                      secondary: Color(0xFF525659),
                      onSecondary: Color(0xFF525659),
                      error: Colors.red,
                      onError: Colors.red,
                      background: Colors.white,
                      onBackground: Colors.white,
                      surface: Color(0xFFED8429),
                      onSurface: Colors.white,
                    ),
                    primaryTextTheme: const TextTheme(
                        bodyLarge: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Color(0xFF525659),
                        ),
                        bodyMedium: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF525659),
                        )),
                  )
                : ThemeData(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    primaryColor: const Color(0xFFED8429),
                    cardTheme: CardTheme(color: Colors.grey[800]),
                    colorScheme: const ColorScheme(
                       secondaryContainer: Colors.white,
                      primaryContainer: Color(0xFF525659),
                      brightness: Brightness.light,
                      primary: Color(0xFFED8429),
                      onPrimary: Colors.white,
                      secondary: Colors.white,
                      onSecondary: Colors.white,
                      error: Colors.red,
                      onError: Colors.red,
                      background: Colors.white,
                      onBackground: Color(0xFF525659),
                      surface: Color(0xFFED8429),
                      onSurface: Color(0xFF525659),
                    ),
                    primaryTextTheme: const TextTheme(
                        bodyLarge: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        bodyMedium: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        )),
                  ),
            // darkTheme: ThemeData(
            //   brightness: Brightness.dark, // Tema oscuro
            // ),
          );
        },
      ),
    );
  }
}
