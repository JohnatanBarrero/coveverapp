import 'package:coveverapp/features/login/domain/models/user_model.dart';

abstract class AbstractRegisterApi {

  Future<bool> register(
    UserModel userModel,
  );
}
