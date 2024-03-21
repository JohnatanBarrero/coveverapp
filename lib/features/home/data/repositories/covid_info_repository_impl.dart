import 'package:coveverapp/features/home/data/data_sources/remote/covid_info_impl_api.dart';
import 'package:coveverapp/features/home/domain/models/info_covid_model.dart';
import 'package:coveverapp/features/home/domain/repositories/abstract_covid_info_repository.dart';

class CovidInfoRepositoryImpl extends AbstractCovidInfoRepository {
  final CovidInfoImplApi covidInfoImplApi;

  CovidInfoRepositoryImpl(
    this.covidInfoImplApi,
  );
  @override
  Future<InfoCovidModel> getInfoCovid() async {
    return await covidInfoImplApi.getInfoCovid();
  }
}
