import 'package:coveverapp/features/login/domain/models/user_model.dart';

abstract class AbstractRegisterRepository {
 
  Future<bool> register(UserModel userModel);
}
