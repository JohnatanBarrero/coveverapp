import 'package:coveverapp/features/states/data/data_sources/remote/info_state_impl_api.dart';
import 'package:coveverapp/features/states/domain/models/info_state_detail_model.dart';
import 'package:coveverapp/features/states/domain/models/info_state_model.dart';
import 'package:coveverapp/features/states/domain/repositories/abstrac_info_state_repository.dart';

class InfoStateRepositoryImpl extends AbstractInfoStateRepository {
  final InfoStateImpl infoStateImpl;

  InfoStateRepositoryImpl(
    this.infoStateImpl,
  );


  @override
  Future<List<InfoStates>> getInfoState() async{
  return  await infoStateImpl.getInfoState();
  }

  @override
  Future<List<InfoStatesDetail>> getInfoStateDetail() async {
    return  await infoStateImpl.getInfoStateDetail();
  }
}
