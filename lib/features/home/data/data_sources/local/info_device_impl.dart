import 'package:coveverapp/core/models/info_device_model.dart';
import 'package:coveverapp/features/home/data/data_sources/local/abstrac_info_device.dart';
import 'package:coveverapp/shared/utils/info_device.dart';

class InfoDeviceImpl extends AbstractInfoDevice {
  @override
  Future<InfoDevice> getInfoDispositivo() async {
    final response = obtenerInfoDispositivo();
    return response;
  }
}
