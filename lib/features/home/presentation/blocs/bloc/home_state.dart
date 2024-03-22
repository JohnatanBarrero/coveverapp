part of 'home_bloc.dart';


abstract class HomeState extends Equatable {
  final HomeModel homeModel;
  const HomeState(this.homeModel);

  @override
  List<Object> get props => [homeModel];
}

class InitialState extends HomeState {
  const InitialState(HomeModel homeModel) : super(homeModel);
}

class GettingInfoCovidState extends HomeState {
  const GettingInfoCovidState(HomeModel homeModel) : super(homeModel);
}
class GotInfoCovidState extends HomeState {
  const GotInfoCovidState(HomeModel homeModel) : super(homeModel);
}

class ErrorInfoCovidState extends HomeState {
  const ErrorInfoCovidState(HomeModel homeModel) : super(homeModel);
}

class GettingInfoDeviceState extends HomeState {
  const GettingInfoDeviceState(HomeModel homeModel) : super(homeModel);
}
class GotInfoDeviceState extends HomeState {
  const GotInfoDeviceState(HomeModel homeModel) : super(homeModel);
}

class ErrorInfoDeviceState extends HomeState {
  const ErrorInfoDeviceState(HomeModel homeModel) : super(homeModel);
}


