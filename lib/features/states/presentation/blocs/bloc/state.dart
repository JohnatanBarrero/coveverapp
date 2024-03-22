part of 'bloc.dart';

@immutable
abstract class State extends Equatable {
  final InfoStatesResultModel model;
  const State(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends State {
  const InitialState(InfoStatesResultModel model) : super(model);
}

class GettingStatestate extends State {
  const GettingStatestate(InfoStatesResultModel model) : super(model);
}
class GotStatestate extends State {
  const GotStatestate(InfoStatesResultModel model) : super(model);
}
class ErrorGetStatestate extends State {
  const ErrorGetStatestate(InfoStatesResultModel model) : super(model);
}