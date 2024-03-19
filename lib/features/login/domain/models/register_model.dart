import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final String? name;
  final String? lastName;
  final String? email;
  final String typeDocumentSelected;
  final String? numberDocument;
  final String? password;
  final String? passwordAgain;
  final bool obscureText;
  

  const RegisterModel({
    this.name,
    this.lastName,
    this.email,
    this.typeDocumentSelected = 'NA',
    this.numberDocument,
    this.password,
    this.passwordAgain,
    this.obscureText = true,
  });

  RegisterModel copyWith({
    String? name,
    String? lastName,
    String? email,
    String? typeDocumentSelected,
    String? numberDocument,
    String? password,
    String? passwordAgain,
    bool? obscureText,
  }) =>
      RegisterModel(
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        typeDocumentSelected: typeDocumentSelected ?? this.typeDocumentSelected,
        numberDocument: numberDocument ?? this.numberDocument,
        password: password ?? this.password,
        passwordAgain: passwordAgain ?? this.passwordAgain,
        obscureText: obscureText ?? this.obscureText,
      );

  @override
  List<Object?> get props => [
        name,
        lastName,
        email,
        typeDocumentSelected,
        numberDocument,
        password,
        passwordAgain,
        obscureText,
      ];
}
