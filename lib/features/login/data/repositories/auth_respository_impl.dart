
import 'package:coveverapp/features/login/data/data_sources/remote/auth_impl_api.dart';
import 'package:coveverapp/features/login/domain/models/user_model.dart';
import 'package:coveverapp/features/login/domain/repositories/abstract_auth_respository.dart';

class AuthRepositoryImpl extends AbstractAuthRepository {
  
    final AuthImplApi articlesApi;

  AuthRepositoryImpl(
    this.articlesApi,
  );

  @override
  Future<UserModel> login(String numberDocument, String password, String typeDocument) async{
   
   return await articlesApi.loginLocal(numberDocument, password, typeDocument);
  }

}