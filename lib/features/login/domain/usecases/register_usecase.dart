
import 'package:coveverapp/features/login/domain/models/user_model.dart';
import 'package:coveverapp/features/login/domain/repositories/abstract_register_repository.dart';

class RegisterUseCase {
  final AbstractRegisterRepository abstractRegisterRepository;

  RegisterUseCase(this.abstractRegisterRepository);

  Future<bool> send(
      UserModel userModel) async {
    try {
      final response = await abstractRegisterRepository.register(userModel);
       return response;
    } catch (e) {
      return false;
    }
  }
}
