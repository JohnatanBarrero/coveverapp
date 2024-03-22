import 'package:bloc/bloc.dart' as bloc;
import 'package:coveverapp/features/states/domain/models/info_states_result_model.dart';
import 'package:coveverapp/features/states/domain/usecases/info_state_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';
part 'event.dart';

class Bloc extends bloc.Bloc<Event, State> {
  InfoStateUseCase? infoStateUseCase;

  Bloc({required this.infoStateUseCase}) : super(initialState) {
    on<LoadInitialEvent>(_loadInitialEvent);
    on<GetInfoStateEvent>(_getInfoStateEvent);
  }

  static State get initialState => const InitialState(
        InfoStatesResultModel(),
      );
  void _loadInitialEvent(LoadInitialEvent event, Emitter<State> emit) {
    emit(
      InitialState(state.model),
    );
  }

  void _getInfoStateEvent(GetInfoStateEvent event, Emitter<State> emit) async {
    emit(
      GettingStatestate(state.model),
    );
    try {
      final ltsInfoStates = await infoStateUseCase!.call();

      emit(
        GotStatestate(
          state.model.copyWith(
            ltsInfoStateSumaryModel: ltsInfoStates,
          ),
        ),
      );
    } catch (e) {
      emit(
        ErrorGetStatestate(state.model),
      );
    }
  }
}
