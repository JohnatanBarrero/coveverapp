
import 'package:coveverapp/core/models/info_device_model.dart';
import 'package:coveverapp/features/home/domain/models/info_covid_model.dart';
import 'package:equatable/equatable.dart';

class HomeModel extends Equatable {
  final String? versionMobile;
  final InfoCovidModel? infoCovidModel;
  final InfoDevice? infoDevice;

  const HomeModel({
    this.versionMobile,
    this.infoCovidModel,
    this.infoDevice,
  });

  HomeModel copyWith({
    String? versionMobile,
    InfoCovidModel? infoCovidModel,
    InfoDevice? infoDevice,
  }) =>
      HomeModel(
        versionMobile: versionMobile ?? this.versionMobile,
           infoCovidModel: infoCovidModel ?? this.infoCovidModel,
           infoDevice: infoDevice ?? this.infoDevice,
      );

  @override
  List<Object?> get props => [
        versionMobile,
        infoCovidModel,
        infoDevice,
      ];
}
