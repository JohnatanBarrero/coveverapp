part of 'bloc.dart';

abstract class Event extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadInitialEvent extends Event {
  LoadInitialEvent();
}

class LoginUserEvent extends Event {
  final String numberDocument;
  final String typeDocument;
  final String password;
  LoginUserEvent(this.numberDocument, this.typeDocument, this.password);
}

class SelectTypeDocumentEvent extends Event {
  final String typeDocument;
  SelectTypeDocumentEvent(this.typeDocument);
}