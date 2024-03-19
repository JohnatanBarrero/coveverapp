part of 'bloc.dart';

abstract class Event extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadInitialEvent extends Event {
  LoadInitialEvent();
}

class LoginUserEvent extends Event {
  LoginUserEvent();
}

class SelectTypeDocumentEvent extends Event {
  final String typeDocument;
  SelectTypeDocumentEvent(this.typeDocument);
}

class SetNumberDocumentEvent extends Event {
  final String numberDocument;
  SetNumberDocumentEvent(this.numberDocument);
}

class SetPasswordEvent extends Event {
  final String password;
  SetPasswordEvent(this.password);
}

class ChangeTextPassEvent extends Event {
  final bool canToShow;
  ChangeTextPassEvent(this.canToShow);
}

class RegisterUserEvent extends Event {
  RegisterUserEvent();
}
