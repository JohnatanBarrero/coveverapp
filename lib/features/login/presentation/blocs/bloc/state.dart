part of 'bloc.dart';

@immutable
abstract class State extends Equatable {
  final LoginModel loginModel;
  const State(this.loginModel);

  @override
  List<Object> get props => [loginModel];
}

class InitialState extends State {
  const InitialState(LoginModel loginModel) : super(loginModel);
}

class GenericSettingState extends State {
  const GenericSettingState(LoginModel loginModel) : super(loginModel);
}

class ChangedTextPassState extends State {
  const ChangedTextPassState(LoginModel loginModel) : super(loginModel);
}

class LoginStartState extends State {
  const LoginStartState(LoginModel loginModel) : super(loginModel);
}

class LogingSuccesFullState extends State {
  const LogingSuccesFullState(LoginModel loginModel) : super(loginModel);
}

class LogingErrorState extends State {
  const LogingErrorState(LoginModel loginModel) : super(loginModel);
}

class LoginFailedState extends State {
  const LoginFailedState(LoginModel loginModel) : super(loginModel);
}

class SelectedTypeDocumentState extends State {
  const SelectedTypeDocumentState (LoginModel loginModel) : super(loginModel);
}

class SettedPasswordState  extends State {
  const SettedPasswordState (LoginModel loginModel) : super(loginModel);
}

class SettedNumberDocumentState  extends State {
  const SettedNumberDocumentState (LoginModel loginModel) : super(loginModel);
}

class ChangedPassState  extends State {
  const ChangedPassState (LoginModel loginModel) : super(loginModel);
}

class RegisterUserState  extends State {
  const RegisterUserState (LoginModel loginModel) : super(loginModel);
}