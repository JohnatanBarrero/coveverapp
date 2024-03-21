part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}


class LoadInitialEvent extends HomeEvent {
   LoadInitialEvent();
}

class GetInfoCovidEvent extends HomeEvent {
   GetInfoCovidEvent();
}
class GetInfoDeviceEvent extends HomeEvent {
   GetInfoDeviceEvent();
}
