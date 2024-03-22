import 'package:coveverapp/features/states/domain/models/info_state_detail_model.dart';
import 'package:coveverapp/features/states/domain/models/info_state_model.dart';

abstract class AbstractInfoStateRepository {
 
   Future<List<InfoStates>> getInfoState();
  Future<List<InfoStatesDetail>>getInfoStateDetail();
}