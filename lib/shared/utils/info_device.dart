import 'dart:io';

import 'package:coveverapp/core/models/info_device_model.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

Future<InfoDevice> obtenerInfoDispositivo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return InfoDevice(
        nombre: androidInfo.device,
        marca: androidInfo.brand,
        modelo: androidInfo.model,
        sistemaOperativo: 'Android ${androidInfo.version.release}',
        tipo: 'Android',
      );
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      return InfoDevice(
        nombre: iosInfo.name,
        marca: 'Apple',
        modelo: iosInfo.model,
        sistemaOperativo: 'iOS ${iosInfo.systemVersion}',
        tipo: 'AndriOSoid',
      );
    } else {
      return InfoDevice(
        nombre: 'No reconocido',
        marca: 'No reconocido',
        modelo: 'No reconocido',
        sistemaOperativo: 'No reconocido',
        tipo: 'No reconocido',
      );
    }
  } catch (e) {
    debugPrint('Error al obtener la información del dispositivo: $e');
    return InfoDevice(
      nombre: 'No reconocido',
      marca: 'No reconocido',
      modelo: 'No reconocido',
      sistemaOperativo: 'No reconocido',
      tipo: 'No reconocido',
    );
  }
}
