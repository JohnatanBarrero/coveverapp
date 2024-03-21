import 'package:coveverapp/core/models/info_device_model.dart';
import 'package:coveverapp/features/home/domain/repositories/abstract_info_device_repository.dart';

class InfoDeviceUseCase {
  final AbstractInfoDeviceRepository abstractInfoDeviceRepository;

  InfoDeviceUseCase(this.abstractInfoDeviceRepository);

  Future<InfoDevice> call() async {
    final infoDeviceModel =
        await abstractInfoDeviceRepository.getInfoDispositivo();
    return infoDeviceModel;
  }
}
