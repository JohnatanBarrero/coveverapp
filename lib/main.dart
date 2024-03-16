import 'package:coveverapp/config/http/http_manager.dart';
import 'package:coveverapp/config/module.dart';
import 'package:coveverapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:coveverapp/features/login/presentation/blocs/bloc/bloc.dart' as bloc_login;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Modular.get<HttpManager>().init(
      urlBase: 'https://api.covidtracking.com/v1/',
    );

      final bloc_login.Bloc blocLogin = Modular.get();
    blocLogin.add(
      bloc_login.LoadInitialEvent(),
    );
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
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        primaryColor: const Color(0xFF4069A1),
      ),
    );
  } 
}
