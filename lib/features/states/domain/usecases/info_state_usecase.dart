import 'package:coveverapp/features/states/domain/models/info_state_detail_model.dart';
import 'package:coveverapp/features/states/domain/models/info_state_model.dart';
import 'package:coveverapp/features/states/domain/models/info_state_sumary_model.dart';
import 'package:coveverapp/features/states/domain/repositories/abstrac_info_state_repository.dart';

class InfoStateUseCase {
  final AbstractInfoStateRepository abstractInfoStateRepository;

  InfoStateUseCase(this.abstractInfoStateRepository);

  Future<List<InfoStateSumaryModel>> call() async {
    //Este metodo llama la info de manera asyncrona al mismo tiempo
    // Llamada asíncrona 1 info states basica
    Future<List<InfoStates>> future1 =
        abstractInfoStateRepository.getInfoState();

    // Llamada asíncrona 2 info states detallada
    Future<List<InfoStatesDetail>> future2 =
        abstractInfoStateRepository.getInfoStateDetail();

    // Esperar a que ambas llamadas asíncronas se completen simultáneamente
    List<dynamic> results = await Future.wait([future1, future2]);

    // Procesar el resultado de la primera llamada
    List<InfoStates> ltsInfoStates = results[0] as List<InfoStates>;

    // Procesar el resultado de la segunda llamada
    List<InfoStatesDetail> ltsInfoStatesDetail =
        results[1] as List<InfoStatesDetail>;

    List<InfoStateSumaryModel> ltsInfoStatesSumary = [];

    for (var stateItem in ltsInfoStates) {
      var stateDetail = ltsInfoStatesDetail.firstWhere(
          (stateDetail) => stateItem.state == stateDetail.state,
          orElse: () => InfoStatesDetail());
      if (stateDetail.state != '') {
        ltsInfoStatesSumary.add(InfoStateSumaryModel(
          state: stateItem.state,
          name: stateItem.name,
          totalTestResults: int.parse(stateDetail.totalTestResults.toString()),
          lastUpdateEt: stateDetail.lastUpdateEt.toString(),
        ));
      }
    }

    return ltsInfoStatesSumary;
  }
}
