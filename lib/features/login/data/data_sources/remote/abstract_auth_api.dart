import 'package:coveverapp/features/login/domain/models/user_model.dart';

abstract class AbstractAuthApi {

  Future<UserModel> login(
    String numberDocument,
    String password,
    String typeDocument,
  );
   Future<UserModel> loginLocal(
    String numberDocument,
    String password,
    String typeDocument,
  );
}
