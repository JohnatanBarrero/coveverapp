import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class JsonLoader {
  final String _filePath;

  JsonLoader(this._filePath);

  Future<dynamic> cargarDatosJson() async {
    try {
      // Obtener la referencia al archivo JSON desde los activos
      final jsonString = await rootBundle.loadString(_filePath);
      
      // Decodificar el JSON
      final dynamic data = json.decode(jsonString);
      
      return data;
    } catch (e) {
      // Manejar errores aquí, como la imposibilidad de cargar el archivo o el formato JSON incorrecto
     debugPrint('Error al cargar el archivo de json');
      return null;
    }
  }
}