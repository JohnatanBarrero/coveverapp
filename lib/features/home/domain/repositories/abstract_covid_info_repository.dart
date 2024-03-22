
import 'package:coveverapp/features/home/domain/models/info_covid_model.dart';

abstract class AbstractCovidInfoRepository {
 
  Future<InfoCovidModel> getInfoCovid();
}