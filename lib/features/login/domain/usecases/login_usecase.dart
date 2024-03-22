import 'package:coveverapp/features/login/domain/repositories/abstract_auth_respository.dart';

class LoginUseCase {
  final AbstractAuthRepository abstractAuthRepository;

  LoginUseCase(this.abstractAuthRepository);
  Future<bool> call(
      String numberDocument, String password, String typeDocument) async {
    try {
      final user = await abstractAuthRepository.login(
        numberDocument,
        password,
        typeDocument,
      );
      return user.name.isEmpty ? false : true; 
    } catch (e) {
      return false;
    }
  }
}
