import 'package:coveverapp/features/login/data/data_sources/remote/register_impl_api.dart';
import 'package:coveverapp/features/login/domain/models/user_model.dart';
import 'package:coveverapp/features/login/domain/repositories/abstract_register_repository.dart';

class RegisterRepositiryImpl extends AbstractRegisterRepository {
  final RegisterImplApi registerImplApi;

  RegisterRepositiryImpl(
    this.registerImplApi,
  );

  @override
  Future<bool> register(UserModel userModel) async {
    return await registerImplApi.register(userModel);
  }
}
