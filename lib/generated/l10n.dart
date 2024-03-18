// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Bienvenido a`
  String get welcometo {
    return Intl.message(
      'Bienvenido a',
      name: 'welcometo',
      desc: '',
      args: [],
    );
  }

  /// `Evertec`
  String get evertec {
    return Intl.message(
      'Evertec',
      name: 'evertec',
      desc: '',
      args: [],
    );
  }

  /// `Campo nombre invalido`
  String get fieldNameInvalid {
    return Intl.message(
      'Campo nombre invalido',
      name: 'fieldNameInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Campo contraseña invalido`
  String get fieldpassInvalid {
    return Intl.message(
      'Campo contraseña invalido',
      name: 'fieldpassInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Tipo de Documento`
  String get typeDocument {
    return Intl.message(
      'Tipo de Documento',
      name: 'typeDocument',
      desc: '',
      args: [],
    );
  }

  /// `Número de Documento`
  String get numberDocument {
    return Intl.message(
      'Número de Documento',
      name: 'numberDocument',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get password {
    return Intl.message(
      'Contraseña',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Registrar Usuario`
  String get registerUser {
    return Intl.message(
      'Registrar Usuario',
      name: 'registerUser',
      desc: '',
      args: [],
    );
  }

  /// `Tipo de documento invalido`
  String get fieldTypeDocumentInvalid {
    return Intl.message(
      'Tipo de documento invalido',
      name: 'fieldTypeDocumentInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Seleccione un tipo de documento`
  String get selectAtypedocument {
    return Intl.message(
      'Seleccione un tipo de documento',
      name: 'selectAtypedocument',
      desc: '',
      args: [],
    );
  }

  /// `Página en Construcción.`
  String get pageInConstruction {
    return Intl.message(
      'Página en Construcción.',
      name: 'pageInConstruction',
      desc: '',
      args: [],
    );
  }

  /// `Login de google no disponible, disculpe las molestias, le recomendamos registrarse manualmente`
  String get logingGoogleNotAviable {
    return Intl.message(
      'Login de google no disponible, disculpe las molestias, le recomendamos registrarse manualmente',
      name: 'logingGoogleNotAviable',
      desc: '',
      args: [],
    );
  }

  /// `Login de Facebook no disponible, disculpe las molestias, le recomendamos registrarse manualmente`
  String get logingFacebookNotAviable {
    return Intl.message(
      'Login de Facebook no disponible, disculpe las molestias, le recomendamos registrarse manualmente',
      name: 'logingFacebookNotAviable',
      desc: '',
      args: [],
    );
  }

  /// `Login de Instagram no disponible, disculpe las molestias, le recomendamos registrarse manualmente`
  String get logingInstagramNotAviable {
    return Intl.message(
      'Login de Instagram no disponible, disculpe las molestias, le recomendamos registrarse manualmente',
      name: 'logingInstagramNotAviable',
      desc: '',
      args: [],
    );
  }

  /// `Cerrar`
  String get close {
    return Intl.message(
      'Cerrar',
      name: 'close',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
