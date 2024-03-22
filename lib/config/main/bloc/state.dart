part of 'bloc.dart';

@immutable
abstract class State extends Equatable {
  final MainAppModel model;
  const State(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends State {
  const InitialState(MainAppModel model) : super(model);
}

class ChangingThemeAppState extends State {
  const ChangingThemeAppState(MainAppModel model) : super(model);
}
class ChangedThemeAppState extends State {
  const ChangedThemeAppState(MainAppModel model) : super(model);
}

class ErrorChangingThemeState extends State {
  const ErrorChangingThemeState(MainAppModel model) : super(model);
}