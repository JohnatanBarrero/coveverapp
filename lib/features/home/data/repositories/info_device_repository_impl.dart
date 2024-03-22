import 'package:coveverapp/core/models/info_device_model.dart';

import 'package:coveverapp/features/home/data/data_sources/local/info_device_impl.dart';
import 'package:coveverapp/features/home/domain/repositories/abstract_info_device_repository.dart';

class InfoDeviceRepositoryImpl extends AbstractInfoDeviceRepository {
  final InfoDeviceImpl infoDeviceImpl;

  InfoDeviceRepositoryImpl(
    this.infoDeviceImpl,
  );

  @override
  Future<InfoDevice> getInfoDispositivo() async {
    return await infoDeviceImpl.getInfoDispositivo();
  }
}
