part of 'register_bloc.dart';

abstract class Event extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadInitialEvent extends Event {
  LoadInitialEvent();
}

class SetNameEvent extends Event {
  final String name;
  SetNameEvent(this.name);
}

class SetLastNameEvent extends Event {
  final String lastName;
  SetLastNameEvent(this.lastName);
}

class SetEmailEvent extends Event {
  final String email;
  SetEmailEvent(this.email);
}

class SetPasswordEvent extends Event {
  final String pass;
  SetPasswordEvent(this.pass);
}

class SetPasswordAgainEvent extends Event {
  final String passAgain;
  SetPasswordAgainEvent(this.passAgain);
}

class SetTypeDocumentEvent extends Event {
  final String typeDocument;
  SetTypeDocumentEvent(this.typeDocument);
}

class SetNumberDocumentEvent extends Event {
  final String numberDocument;
  SetNumberDocumentEvent(this.numberDocument);
}

class ChangeTextPassEvent extends Event {
  final bool canToShow;
  ChangeTextPassEvent(this.canToShow);
}
class SendDataRegisterEvent extends Event {
 
  SendDataRegisterEvent();
}

