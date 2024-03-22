
import 'package:coveverapp/config/http/api.dart';
import 'package:coveverapp/features/states/data/data_sources/remote/abstract_info_state_api.dart';
import 'package:coveverapp/features/states/domain/models/info_state_detail_model.dart';
import 'package:coveverapp/features/states/domain/models/info_state_model.dart';

class InfoStateImpl extends AbstractInfoStateApi {
  @override
  Future<List<InfoStates>> getInfoState() async {
  
   final response = await Api.getApi('states/info.json');

    final ltsinfo = response.data
        .map<InfoStates>((element) => InfoStates.fromJson(element))
        .toList();

    return ltsinfo;
  }

  @override
  Future<List<InfoStatesDetail>> getInfoStateDetail() async {
   final response = await Api.getApi('states/current.json');

    final ltsinfo = response.data
        .map<InfoStatesDetail>((element) => InfoStatesDetail.fromJson(element))
        .toList();

    return ltsinfo;
  }

 
}