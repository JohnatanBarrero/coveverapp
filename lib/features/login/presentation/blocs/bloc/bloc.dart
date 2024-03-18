import 'package:bloc/bloc.dart' as bloc;
import 'package:coveverapp/features/login/domain/models/login_model.dart';
import 'package:coveverapp/features/login/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';
part 'event.dart';

class Bloc extends bloc.Bloc<Event, State> {
  LoginUseCase? loginUseCase;

  Bloc({required this.loginUseCase}) : super(initialState) {
    on<LoadInitialEvent>(_loadInitialEvent);
    on<LoginUserEvent>(_loginUserEvent);
    on<SelectTypeDocumentEvent>(_selectTypeDocumentEvent);
  }
  static State get initialState => const InitialState(
        LoginModel(),
      );
  void _loadInitialEvent(LoadInitialEvent event, Emitter<State> emit) {
    emit(
      InitialState(state.loginModel),
    );
  }

  void _selectTypeDocumentEvent(
      SelectTypeDocumentEvent event, Emitter<State> emit) {
    print(event.typeDocument);
    emit(
      SelectedTypeDocumentEvent(
        state.loginModel.copyWith(
          typeDocumentSelected: event.typeDocument,
        ),
      ),
    );
  }

  void _loginUserEvent(LoginUserEvent event, Emitter<State> emit) async {
    emit(
      LoginStartState(
        state.loginModel,
      ),
    );
    try {
      final isLogin = await loginUseCase!
          .call(event.numberDocument, event.password, event.typeDocument);
      if (isLogin) {
        emit(
          LogingSuccesFullState(
            state.loginModel,
          ),
        );
      } else {
        emit(
          LoginFailedState(
            state.loginModel,
          ),
        );
      }
    } catch (e) {
      emit(
        LogingErrorState(
          state.loginModel,
        ),
      );
    }
  }
}
