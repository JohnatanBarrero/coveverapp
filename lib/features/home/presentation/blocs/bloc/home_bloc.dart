import 'package:bloc/bloc.dart';

import 'package:coveverapp/features/home/domain/models/home_model.dart';

import 'package:coveverapp/features/home/domain/usecases/covid_info_usecase.dart';
import 'package:coveverapp/features/home/domain/usecases/info_device_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:package_info/package_info.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  CovidInfoUseCase? covidInfoUseCase;
  InfoDeviceUseCase? infoDeviceUseCase;

  HomeBloc({required this.covidInfoUseCase, required this.infoDeviceUseCase})
      : super(initialState) {
    on<LoadInitialEvent>(_loadInitialEvent);
    on<GetInfoCovidEvent>(_getInfoCovidEvent);
    on<GetInfoDeviceEvent>(_getInfoDeviceEvent);
 
  }

  static HomeState get initialState => const InitialState(HomeModel());

  void _loadInitialEvent(LoadInitialEvent event, Emitter<HomeState> emit) {
    emit(
      InitialState(state.homeModel),
    );
  }



  void _getInfoCovidEvent(
      GetInfoCovidEvent event, Emitter<HomeState> emit) async {
    emit(
      GettingInfoCovidState(state.homeModel),
    );

    try {
      final response = await covidInfoUseCase!.call();
      emit(
        GotInfoCovidState(
          state.homeModel.copyWith(
            infoCovidModel: response,
          ),
        ),
      );
    } catch (e) {
      emit(
        ErrorInfoCovidState(state.homeModel),
      );
    }
  }

  void _getInfoDeviceEvent(
      GetInfoDeviceEvent event, Emitter<HomeState> emit) async {
    emit(
      GettingInfoDeviceState(state.homeModel),
    );

    try {
      final response = await infoDeviceUseCase!.call();
      emit(
        GotInfoCovidState(
          state.homeModel.copyWith(
            infoDevice: response,
            versionMobile: await setVersionApp(),
          ),
        ),
      );
    } catch (e) {
      emit(
        ErrorInfoDeviceState(state.homeModel),
      );
    }
  }

  Future<String> setVersionApp() async {
    late String version;
    try {
      version = (await PackageInfo.fromPlatform()).version;
    } catch (e) {
      version = '1.0.1';
    }
    return version;
  }
}
