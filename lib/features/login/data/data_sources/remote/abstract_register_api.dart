import 'package:coveverapp/features/login/domain/models/user_model.dart';

abstract class AbstractRegisterApi {
  // Get all article
  Future<bool> register(
    UserModel userModel,
  );
}
