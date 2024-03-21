import 'package:coveverapp/config/http/api.dart';
import 'package:coveverapp/features/home/data/data_sources/remote/abstract_covid_info_api.dart';
import 'package:coveverapp/features/home/domain/models/info_covid_model.dart';

class CovidInfoImplApi extends AbstractCovidInfoApi {
  @override
  Future<InfoCovidModel> getInfoCovid() async {
    final response = await Api.getApi('us/current.json');

    final ltsinfo = response.data
        .map<InfoCovidModel>((element) => InfoCovidModel.fromJson(element))
        .toList();

    return ltsinfo[0];
  }
}
