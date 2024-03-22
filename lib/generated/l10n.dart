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

  /// `Campo Apellido invalido`
  String get fieldLastNameInvalid {
    return Intl.message(
      'Campo Apellido invalido',
      name: 'fieldLastNameInvalid',
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

  /// `Campo email invalido`
  String get fieldEmailInvalid {
    return Intl.message(
      'Campo email invalido',
      name: 'fieldEmailInvalid',
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

  /// `Credenciales invalidas`
  String get invalidCredentials {
    return Intl.message(
      'Credenciales invalidas',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Las credenciales no han sido validas, intente de nuevo o registrese si no tiene cuenta`
  String get tryAgainOrRegister {
    return Intl.message(
      'Las credenciales no han sido validas, intente de nuevo o registrese si no tiene cuenta',
      name: 'tryAgainOrRegister',
      desc: '',
      args: [],
    );
  }

  /// `Intentar de nuevo`
  String get tryAgain {
    return Intl.message(
      'Intentar de nuevo',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Nombre`
  String get name {
    return Intl.message(
      'Nombre',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Apellido`
  String get lastLame {
    return Intl.message(
      'Apellido',
      name: 'lastLame',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Registro`
  String get register {
    return Intl.message(
      'Registro',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Confirme contraseña`
  String get confirmPassword {
    return Intl.message(
      'Confirme contraseña',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Las contraseñas deben ser iguales`
  String get passShouldBeSame {
    return Intl.message(
      'Las contraseñas deben ser iguales',
      name: 'passShouldBeSame',
      desc: '',
      args: [],
    );
  }

  /// `Error registrando usuario`
  String get errrorRegisterUser {
    return Intl.message(
      'Error registrando usuario',
      name: 'errrorRegisterUser',
      desc: '',
      args: [],
    );
  }

  /// `No hemos podido hacer el registro del usuario intente mas tarde o contacte al administrador`
  String get errorRegisterUserWhy {
    return Intl.message(
      'No hemos podido hacer el registro del usuario intente mas tarde o contacte al administrador',
      name: 'errorRegisterUserWhy',
      desc: '',
      args: [],
    );
  }

  /// `Nombre del dispositivo`
  String get deviceName {
    return Intl.message(
      'Nombre del dispositivo',
      name: 'deviceName',
      desc: '',
      args: [],
    );
  }

  /// `Tipo de dispositivo`
  String get deviceType {
    return Intl.message(
      'Tipo de dispositivo',
      name: 'deviceType',
      desc: '',
      args: [],
    );
  }

  /// `Sistema operativo y su versión`
  String get operatingSystem {
    return Intl.message(
      'Sistema operativo y su versión',
      name: 'operatingSystem',
      desc: '',
      args: [],
    );
  }

  /// `Marca del dispositivo`
  String get deviceBrand {
    return Intl.message(
      'Marca del dispositivo',
      name: 'deviceBrand',
      desc: '',
      args: [],
    );
  }

  /// `Modelo del dispositivo`
  String get deviceModel {
    return Intl.message(
      'Modelo del dispositivo',
      name: 'deviceModel',
      desc: '',
      args: [],
    );
  }

  /// `Fecha actual`
  String get currentDate {
    return Intl.message(
      'Fecha actual',
      name: 'currentDate',
      desc: '',
      args: [],
    );
  }

  /// `El proyecto COVID Tracking ha finalizado toda recopilación de datos a partir del 7 de marzo de 2021`
  String get covidProject {
    return Intl.message(
      'El proyecto COVID Tracking ha finalizado toda recopilación de datos a partir del 7 de marzo de 2021',
      name: 'covidProject',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de recolección de datos`
  String get dataCollectionDate {
    return Intl.message(
      'Fecha de recolección de datos',
      name: 'dataCollectionDate',
      desc: '',
      args: [],
    );
  }

  /// `Casos totales`
  String get totalCases {
    return Intl.message(
      'Casos totales',
      name: 'totalCases',
      desc: '',
      args: [],
    );
  }

  /// `Pruebas negativas`
  String get negativeTests {
    return Intl.message(
      'Pruebas negativas',
      name: 'negativeTests',
      desc: '',
      args: [],
    );
  }

  /// `Fallecidos`
  String get deaths {
    return Intl.message(
      'Fallecidos',
      name: 'deaths',
      desc: '',
      args: [],
    );
  }

  /// `Pruebas pendientes`
  String get pendingTests {
    return Intl.message(
      'Pruebas pendientes',
      name: 'pendingTests',
      desc: '',
      args: [],
    );
  }

  /// `Casos confirmados`
  String get confirmedCases {
    return Intl.message(
      'Casos confirmados',
      name: 'confirmedCases',
      desc: '',
      args: [],
    );
  }

  /// `Pruebas positivas`
  String get positiveTests {
    return Intl.message(
      'Pruebas positivas',
      name: 'positiveTests',
      desc: '',
      args: [],
    );
  }

  /// `Recuperados`
  String get recovered {
    return Intl.message(
      'Recuperados',
      name: 'recovered',
      desc: '',
      args: [],
    );
  }

  /// `Fecha actual`
  String get dateCurrently {
    return Intl.message(
      'Fecha actual',
      name: 'dateCurrently',
      desc: '',
      args: [],
    );
  }

  /// `Detelle por región`
  String get detailbyRegion {
    return Intl.message(
      'Detelle por región',
      name: 'detailbyRegion',
      desc: '',
      args: [],
    );
  }

  /// `Ultima modificación`
  String get lastUpdate {
    return Intl.message(
      'Ultima modificación',
      name: 'lastUpdate',
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
