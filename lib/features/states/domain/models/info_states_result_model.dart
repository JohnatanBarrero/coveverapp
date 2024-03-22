import 'package:coveverapp/features/states/domain/models/info_state_sumary_model.dart';
import 'package:equatable/equatable.dart';

class InfoStatesResultModel extends Equatable {
  final List<InfoStateSumaryModel> ltsInfoStateSumaryModel;

  const InfoStatesResultModel({
    this.ltsInfoStateSumaryModel = const [],
  });

  InfoStatesResultModel copyWith({
    List<InfoStateSumaryModel>? ltsInfoStateSumaryModel,
  }) =>
      InfoStatesResultModel(
        ltsInfoStateSumaryModel:
            ltsInfoStateSumaryModel ?? this.ltsInfoStateSumaryModel,
      );

  @override
  List<Object?> get props => [];
}
