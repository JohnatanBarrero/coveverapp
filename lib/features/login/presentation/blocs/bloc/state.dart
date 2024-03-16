part of 'bloc.dart';

@immutable
abstract class State {
  const State();
}

class InitialState extends State {}
class LoginStartState extends State {}
class LogingSuccesFullState extends State {}
class LogingErrorState extends State {}
class LoginFailedState extends State {}


