import 'package:coveverapp/config/http/api.dart';
import 'package:coveverapp/core/utils/json_loader.dart';
import 'package:coveverapp/features/login/data/data_sources/remote/abstract_auth_api.dart';
import 'package:coveverapp/features/login/domain/models/user_model.dart';
import 'package:flutter/material.dart';

class AuthImplApi extends AbstractAuthApi {
  AuthImplApi();

  @override
  Future<UserModel> login(
    String numberDocument,
    String password,
    String typeDocument,
  ) async {
    final response = await Api.getApi('/api/login-users/', params: {
      'numberDocument': 'numberDocument',
      'password': 'password',
      'typeDocument': 'typeDocument',
    });
    return UserModel.fromJson(response.data['payload']);
  }

  @override
  Future<UserModel> loginLocal(
      String numberDocument, String password, String typeDocument) async {
    // Crear una instancia de JsonLoader con la ruta del archivo JSON
    try {
      final JsonLoader jsonLoader = JsonLoader('assets/users.json');

      // Cargar los datos JSON
      final dynamic jsonData = await jsonLoader.cargarDatosJson();

      if (jsonData != null) {
        // List<UserModel> users =
        //     (jsonData as List).map((item) => UserModel.fromJson(item)).toList();

        List<UserModel> ltsUsers = (jsonData)
            .map<UserModel>((element) => UserModel.fromJson(element))
            .toList();

        final userFounded = ltsUsers.firstWhere((element) =>
            element.numberDocument == numberDocument &&
            element.password == password &&
            element.typeDocument == typeDocument);

        return userFounded;
      }
      throw FlutterError(
          'No se encontró ningún usuario con las credenciales proporcionadas.');
    } catch (e) {
      print(e);
      throw FlutterError(
          'No se encontró ningún usuario con las credenciales proporcionadas.');
    }
  }
}
