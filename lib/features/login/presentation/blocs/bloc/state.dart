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

class SelectedTypeDocumentEvent extends State {
  const SelectedTypeDocumentEvent(LoginModel loginModel) : super(loginModel);
}

