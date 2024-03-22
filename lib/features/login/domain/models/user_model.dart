// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String name;
  final String lastName;

  final String email;
  final String password;
  final String typeDocument;
  final String numberDocument;

  UserModel({
    required this.name,
    required this.lastName,
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
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        typeDocument: typeDocument ?? this.typeDocument,
        numberDocument: numberDocument ?? this.numberDocument,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        lastName: json['lastName'],
        email: json['email'],
        password: json['password'],
        typeDocument: json['typeDocument'],
        numberDocument: json['numberDocument'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'lastName': lastName,
        'email': email,
        'password': password,
        'typeDocument': typeDocument,
        'numberDocument': numberDocument,
      };
}
