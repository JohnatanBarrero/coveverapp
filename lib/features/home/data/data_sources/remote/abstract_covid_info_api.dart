import 'package:coveverapp/features/home/domain/models/info_covid_model.dart';

abstract class AbstractCovidInfoApi {
  Future<InfoCovidModel> getInfoCovid();
}
