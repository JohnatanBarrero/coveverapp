
import 'package:coveverapp/core/models/info_device_model.dart';
import 'package:coveverapp/features/home/domain/models/info_covid_model.dart';
import 'package:equatable/equatable.dart';

class HomeModel extends Equatable {
  final String? anyString;
  final InfoCovidModel? infoCovidModel;
  final InfoDevice? infoDevice;

  const HomeModel({
    this.anyString,
    this.infoCovidModel,
    this.infoDevice,
  });

  HomeModel copyWith({
    String? anyString,
    InfoCovidModel? infoCovidModel,
    InfoDevice? infoDevice,
  }) =>
      HomeModel(
        anyString: anyString ?? this.anyString,
           infoCovidModel: infoCovidModel ?? this.infoCovidModel,
           infoDevice: infoDevice ?? this.infoDevice,
      );

  @override
  List<Object?> get props => [
        anyString,
        infoCovidModel,
        infoDevice,
      ];
}
