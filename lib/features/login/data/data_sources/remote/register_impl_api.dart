import 'package:coveverapp/features/login/data/data_sources/remote/abstract_register_api.dart';
import 'package:coveverapp/features/login/domain/models/user_model.dart';
import 'package:coveverapp/shared/utils/json_loader.dart';
import 'package:flutter/material.dart';

class RegisterImplApi extends AbstractRegisterApi {
  RegisterImplApi();

  @override
  Future<bool> register(
    UserModel userModel,
  ) async {
    // Crear una instancia de JsonLoader con la ruta del archivo JSON
    try {
      final JsonLoader jsonLoader = JsonLoader('assets/users.json');

      // Cargar los datos JSON
      final dynamic jsonData = await jsonLoader.leerDatosDesdeArchivo('users');

      if (jsonData != null) {
 

        List<UserModel> ltsUsers = (jsonData)
            .map<UserModel>((element) => UserModel.fromJson(element))
            .toList();

        // Agregar el nuevo usuario a la lista
        ltsUsers.add(userModel);

        // Convertir la lista actualizada de usuarios nuevamente a formato JSON
        List<dynamic> updatedJsonData =
            ltsUsers.map((user) => user.toJson()).toList();

        // Guardar la lista actualizada en el archivo JSON
        await jsonLoader.guardarDatosJson(updatedJsonData, 'users');
  

        return true;
      }
      throw FlutterError(
          'No se encontró ningún usuario con las credenciales proporcionadas.');
    } catch (e) {
      throw FlutterError(
          'No se encontró ningún usuario con las credenciales proporcionadas.');
    }
  }
}
