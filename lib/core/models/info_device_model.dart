// To parse this JSON data, do
//
//     final infoDevice = infoDeviceFromJson(jsonString);

import 'dart:convert';

InfoDevice infoDeviceFromJson(String str) => InfoDevice.fromJson(json.decode(str));

String infoDeviceToJson(InfoDevice data) => json.encode(data.toJson());

class InfoDevice {
    final String nombre;
    final String marca;
    final String modelo;
    final String sistemaOperativo;
    final String tipo;

    InfoDevice({
        required this.nombre,
        required this.marca,
        required this.modelo,
        required this.sistemaOperativo,
        required this.tipo,
    });

    InfoDevice copyWith({
        String? nombre,
        String? marca,
        String? modelo,
        String? sistemaOperativo,
        String? tipo,
    }) => 
        InfoDevice(
            nombre: nombre ?? this.nombre,
            marca: marca ?? this.marca,
            modelo: modelo ?? this.modelo,
            sistemaOperativo: sistemaOperativo ?? this.sistemaOperativo,
            tipo: tipo ?? this.tipo,
        );

    factory InfoDevice.fromJson(Map<String, dynamic> json) => InfoDevice(
        nombre: json['nombre'],
        marca: json['marca'],
        modelo: json['modelo'],
        sistemaOperativo: json['sistema_operativo'],
        tipo: json['tipo'],
    );

    Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'marca': marca,
        'modelo': modelo,
        'sistema_operativo': sistemaOperativo,
        'tipo': tipo,
    };
}
