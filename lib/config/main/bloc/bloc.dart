import 'package:bloc/bloc.dart' as bloc;
import 'package:coveverapp/config/main/models/main_model_app.dart';
import 'package:coveverapp/config/prefs/preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/repository.dart';
part 'state.dart';
part 'event.dart';

class Bloc extends bloc.Bloc<Event, State> {
  Repository? repository;
  Bloc([this.repository]) : super(initialState) {
    repository ??= Repository();
    on<LoadInitialEvent>(_loadInitialEvent);
    on<ChangedThemeAppEvent>(_changedThemeAppEvent);
  }
  static State get initialState => const InitialState(
        MainAppModel(),
      );
  void _loadInitialEvent(LoadInitialEvent event, Emitter<State> emit) {
    emit(
      InitialState(state.model),
    );
  }

  void _changedThemeAppEvent(
      ChangedThemeAppEvent event, Emitter<State> emit) async {
    emit(
      ChangingThemeAppState(state.model),
    );

    try {
      final themeCurrently = Preferences().isdark;
      if (themeCurrently) {
        Preferences().isdark = false;
      } else {
        Preferences().isdark = true;
      }
      emit(
        ChangedThemeAppState(
          state.model.copyWith(isDarkThemeApp: !themeCurrently),
        ),
      );
    } catch (e) {
      emit(
        ErrorChangingThemeState(state.model),
      );
    }
  }
}
