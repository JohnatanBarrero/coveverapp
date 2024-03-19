part of 'register_bloc.dart';

@immutable
abstract class State extends Equatable {
  final RegisterModel registerModel;
  const State(this.registerModel);

  @override
  List<Object> get props => [registerModel];
}

class InitialState extends State {
  const InitialState(RegisterModel model) : super(model);
}

class GeneralState extends State {
  const GeneralState(RegisterModel model) : super(model);
}

class SetedNameState extends State {
  const SetedNameState(RegisterModel model) : super(model);
}

class ChangedTextPassState extends State {
  const ChangedTextPassState(RegisterModel loginModel) : super(loginModel);
}

class SetedLastNameState extends State {
  const SetedLastNameState(RegisterModel model) : super(model);
}

class SetedEmailState extends State {
  const SetedEmailState(RegisterModel model) : super(model);
}

class SetedPasswordState extends State {
  const SetedPasswordState(RegisterModel model) : super(model);
}

class SetedPasswordAgainState extends State {
  const SetedPasswordAgainState(RegisterModel model) : super(model);
}

class SetedTypeDocumentState extends State {
  const SetedTypeDocumentState(RegisterModel model) : super(model);
}

class SetedNumberDocumentState extends State {
  const SetedNumberDocumentState(RegisterModel model) : super(model);
}

class SendingDataRegisterState extends State {
  const SendingDataRegisterState(RegisterModel model) : super(model);
}

class SendedDataRegisterState extends State {
  const SendedDataRegisterState(RegisterModel model) : super(model);
}

class SendErrorDataState extends State {
  const SendErrorDataState(RegisterModel model) : super(model);
}
