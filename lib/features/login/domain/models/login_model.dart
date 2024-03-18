import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String? userId;
  final bool? idDefault;
  final String typeDocumentSelected;

  const LoginModel({
    this.userId,
    this.idDefault,
    this.typeDocumentSelected = 'NA',
  });

  LoginModel copyWith({
    String? userId,
    bool? idDefault,
    String? typeDocumentSelected,
  }) =>
      LoginModel(
        userId: userId ?? this.userId,
        idDefault: idDefault ?? this.idDefault,
        typeDocumentSelected: typeDocumentSelected ?? this.typeDocumentSelected,
      );

  @override
  List<Object?> get props => [
        userId,
        idDefault,
        typeDocumentSelected,
      ];
}
