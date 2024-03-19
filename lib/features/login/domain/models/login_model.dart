import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String? userId;
  final bool? idDefault;
  final String typeDocumentSelected;
  final String? numberDocument;
  final String? password;
  final bool obscureText;

  const LoginModel({
    this.userId,
    this.idDefault,
    this.typeDocumentSelected = 'NA',
    this.numberDocument,
    this.password,
    this.obscureText=true,
  });

  LoginModel copyWith({
    String? userId,
    bool? idDefault,
    String? typeDocumentSelected,
    String? numberDocument,
    String? password,
    bool? obscureText
  }) =>
      LoginModel(
        userId: userId ?? this.userId,
        idDefault: idDefault ?? this.idDefault,
        typeDocumentSelected: typeDocumentSelected ?? this.typeDocumentSelected,
        numberDocument: numberDocument ?? this.numberDocument,
        password: password ?? this.password,
         obscureText: obscureText ?? this.obscureText,
      );

  @override
  List<Object?> get props => [
        userId,
        idDefault,
        typeDocumentSelected,
        numberDocument,
        password,
        obscureText,
      ];
}
