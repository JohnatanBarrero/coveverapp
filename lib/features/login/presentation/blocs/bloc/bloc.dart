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
    on<SetNumberDocumentEvent>(_setNumberDocumentEvent);
    on<SetPasswordEvent>(_setPasswordEvent);
    on<ChangeTextPassEvent>(_changeTextPassEvent);
    on<RegisterUserEvent>(_registerUserEvent);
  }

  static State get initialState => const InitialState(
        LoginModel(),
      );

  void _loadInitialEvent(LoadInitialEvent event, Emitter<State> emit) {
    emit(
      GenericSettingState(
        state.loginModel,
      ),
    );
    emit(
      InitialState(state.loginModel),
    );
  }

  void _registerUserEvent(RegisterUserEvent event, Emitter<State> emit) {
    emit(
      GenericSettingState(
        state.loginModel,
      ),
    );
    emit(
      RegisterUserState(state.loginModel),
    );
  }

  void _setNumberDocumentEvent(
      SetNumberDocumentEvent event, Emitter<State> emit) {
    emit(
      GenericSettingState(
        state.loginModel,
      ),
    );
    emit(
      SettedNumberDocumentState(
        state.loginModel.copyWith(
          numberDocument: event.numberDocument,
        ),
      ),
    );
  }

  void _setPasswordEvent(SetPasswordEvent event, Emitter<State> emit) {
    emit(
      GenericSettingState(
        state.loginModel,
      ),
    );
    emit(
      SettedPasswordState(
        state.loginModel.copyWith(
          password: event.password,
        ),
      ),
    );
  }

  void _changeTextPassEvent(ChangeTextPassEvent event, Emitter<State> emit) {
    emit(
      GenericSettingState(
        state.loginModel,
      ),
    );
    emit(
      ChangedPassState(
        state.loginModel.copyWith(
          obscureText: event.canToShow,
        ),
      ),
    );
  }

  void _selectTypeDocumentEvent(
      SelectTypeDocumentEvent event, Emitter<State> emit) {
    emit(
      GenericSettingState(
        state.loginModel,
      ),
    );

    emit(
      SelectedTypeDocumentState(
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
      final isLogin = await loginUseCase!.call(
        state.loginModel.numberDocument!,
        state.loginModel.password!,
        state.loginModel.typeDocumentSelected,
      );
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
