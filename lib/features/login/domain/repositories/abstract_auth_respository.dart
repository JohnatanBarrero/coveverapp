import 'package:coveverapp/features/login/domain/models/user_model.dart';

abstract class AbstractAuthRepository {
 
  Future<UserModel> login(String numberDocument, String password, String typeDocument);
}
