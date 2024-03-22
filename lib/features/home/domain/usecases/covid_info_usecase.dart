import 'package:coveverapp/features/home/domain/models/info_covid_model.dart';
import 'package:coveverapp/features/home/domain/repositories/abstract_covid_info_repository.dart';

class CovidInfoUseCase {
  final AbstractCovidInfoRepository abstractCovidInfoRepository;

  CovidInfoUseCase(this.abstractCovidInfoRepository);

  Future<InfoCovidModel> call() async {
    final infoCovidModel = await abstractCovidInfoRepository.getInfoCovid();
    return infoCovidModel;
  }
}
