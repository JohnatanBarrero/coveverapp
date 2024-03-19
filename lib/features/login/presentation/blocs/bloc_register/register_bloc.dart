import 'package:bloc/bloc.dart' as bloc;
import 'package:coveverapp/features/login/domain/models/register_model.dart';
import 'package:coveverapp/features/login/domain/models/user_model.dart';
import 'package:coveverapp/features/login/domain/usecases/register_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends bloc.Bloc<Event, State> {
  RegisterUseCase? registerUseCase;
  RegisterBloc({required this.registerUseCase}) : super(initialState) {
    on<LoadInitialEvent>(_loadInitialEvent);
    on<SetNameEvent>(_setNameEvent);
    on<SetLastNameEvent>(_setLastNameEvent);
    on<SetEmailEvent>(_setEmailEvent);
    on<SetPasswordEvent>(_setPasswordEvent);
    on<SetPasswordAgainEvent>(_setPasswordAgainEvent);
    on<SetTypeDocumentEvent>(_setTypeDocumentEvent);
    on<SetNumberDocumentEvent>(_setNumberDocumentEvent);
    on<ChangeTextPassEvent>(_changeTextPassEvent);
    on<SendDataRegisterEvent>(_sendDataEvent);
  }
  static State get initialState => const InitialState(
        RegisterModel(),
      );

  void _sendDataEvent(SendDataRegisterEvent event, Emitter<State> emit) async {
    emit(
      SendingDataRegisterState(state.registerModel),
    );
    try {
      final UserModel userModel = UserModel(
        name: state.registerModel.name!,
        lastName: state.registerModel.lastName!,
        email: state.registerModel.email!,
        password: state.registerModel.password!,
        typeDocument: state.registerModel.typeDocumentSelected,
        numberDocument: state.registerModel.numberDocument!,
      );

      final response = await registerUseCase!.send(userModel);
      if (response) {
        emit(
          SendedDataRegisterState(state.registerModel),
        );
      } else {
        emit(
          SendErrorDataState(state.registerModel),
        );
      }
    } catch (e) {
      emit(
        SendErrorDataState(state.registerModel),
      );
    }
  }

  void _loadInitialEvent(LoadInitialEvent event, Emitter<State> emit) {
    emit(
      InitialState(state.registerModel),
    );
  }

  void _setNameEvent(SetNameEvent event, Emitter<State> emit) {
    emit(
      GeneralState(
        state.registerModel,
      ),
    );

    emit(
      SetedNameState(
        state.registerModel.copyWith(
          name: event.name,
        ),
      ),
    );
  }

  void _setLastNameEvent(SetLastNameEvent event, Emitter<State> emit) {
    emit(
      GeneralState(
        state.registerModel,
      ),
    );

    emit(
      SetedLastNameState(
        state.registerModel.copyWith(
          lastName: event.lastName,
        ),
      ),
    );
  }

  void _changeTextPassEvent(ChangeTextPassEvent event, Emitter<State> emit) {
    emit(
      GeneralState(
        state.registerModel,
      ),
    );
    emit(
      ChangedTextPassState(
        state.registerModel.copyWith(
          obscureText: event.canToShow,
        ),
      ),
    );
  }

  void _setEmailEvent(SetEmailEvent event, Emitter<State> emit) {
    emit(
      GeneralState(
        state.registerModel,
      ),
    );

    emit(
      SetedEmailState(
        state.registerModel.copyWith(
          email: event.email,
        ),
      ),
    );
  }

  void _setPasswordEvent(SetPasswordEvent event, Emitter<State> emit) {
    emit(
      GeneralState(
        state.registerModel,
      ),
    );

    emit(
      SetedPasswordState(
        state.registerModel.copyWith(
          password: event.pass,
        ),
      ),
    );
  }

  void _setPasswordAgainEvent(
      SetPasswordAgainEvent event, Emitter<State> emit) {
    emit(
      GeneralState(
        state.registerModel,
      ),
    );

    emit(
      SetedPasswordAgainState(
        state.registerModel.copyWith(
          passwordAgain: event.passAgain,
        ),
      ),
    );
  }

  void _setTypeDocumentEvent(SetTypeDocumentEvent event, Emitter<State> emit) {
    emit(
      GeneralState(
        state.registerModel,
      ),
    );

    emit(
      SetedTypeDocumentState(
        state.registerModel.copyWith(
          typeDocumentSelected: event.typeDocument,
        ),
      ),
    );
  }

  void _setNumberDocumentEvent(
      SetNumberDocumentEvent event, Emitter<State> emit) {
    emit(
      GeneralState(
        state.registerModel,
      ),
    );

    emit(
      SetedNumberDocumentState(
        state.registerModel.copyWith(
          numberDocument: event.numberDocument,
        ),
      ),
    );
  }
}
