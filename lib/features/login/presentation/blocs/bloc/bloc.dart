import 'package:bloc/bloc.dart' as bloc;
import 'package:coveverapp/features/login/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';
part 'event.dart';

class Bloc extends bloc.Bloc<Event, State> {
  LoginUseCase? loginUseCase;

  Bloc({required this.loginUseCase}) : super(InitialState()) {
    on<LoadInitialEvent>(_loadInitialEvent);
    on<LoginUserEvent>(_loginUserEvent);
  }

  void _loadInitialEvent(LoadInitialEvent event, Emitter<State> emit) {
    emit(
      InitialState(),
    );
  }

  void _loginUserEvent(LoginUserEvent event, Emitter<State> emit) async {
    emit(
      LoginStartState(),
    );
    try {
      final isLogin = await loginUseCase!
          .call(event.numberDocument, event.password, event.typeDocument);
      if (isLogin) {
        emit(
          LogingSuccesFullState(),
        );
      } else {
        emit(
          LoginFailedState(),
        );
      }
    } catch (e) {
      emit(
        LogingErrorState(),
      );
    }
  }
}
