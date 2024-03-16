// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    final String idUser;
    final String name;
    final String lastName;
    final String role;
    final String nameEvent;
    final String email;
    final String password;
    final String typeDocument;
    final String numberDocument;

    UserModel({
        required this.idUser,
        required this.name,
        required this.lastName,
        required this.role,
        required this.nameEvent,
        required this.email,
        required this.password,
        required this.typeDocument,
        required this.numberDocument,
    });

    UserModel copyWith({
        String? idUser,
        String? name,
        String? lastName,
        String? role,
        String? nameEvent,
        String? email,
        String? password,
        String? typeDocument,
        String? numberDocument,
    }) => 
        UserModel(
            idUser: idUser ?? this.idUser,
            name: name ?? this.name,
            lastName: lastName ?? this.lastName,
            role: role ?? this.role,
            nameEvent: nameEvent ?? this.nameEvent,
            email: email ?? this.email,
            password: password ?? this.password,
            typeDocument: typeDocument ?? this.typeDocument,
            numberDocument: numberDocument ?? this.numberDocument,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idUser: json['idUser'],
        name: json['name'],
        lastName: json['lastName'],
        role: json['role'],
        nameEvent: json['nameEvent'],
        email: json['email'],
        password: json['password'],
        typeDocument: json['typeDocument'],
        numberDocument: json['numberDocument'],
    );

    Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'name': name,
        'lastName': lastName,
        'role': role,
        'nameEvent': nameEvent,
        'email': email,
        'password': password,
        'typeDocument': typeDocument,
        'numberDocument': numberDocument,
    };
}
