import 'package:coveverapp/features/home/presentation/widgets/btn_theme_app.dart';
import 'package:coveverapp/features/home/presentation/widgets/data_covid_secction_widget.dart';
import 'package:coveverapp/features/home/presentation/widgets/item_info_device_widget.dart';
import 'package:coveverapp/features/home/presentation/widgets/txtbox_hour_widget.dart';
import 'package:coveverapp/generated/l10n.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:coveverapp/features/home/presentation/blocs/bloc/home_bloc.dart'
    as bloc;
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
export 'package:coveverapp/features/home/presentation/blocs/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSizeWidth = MediaQuery.of(context).size.width;
    final screenSizeHeight = MediaQuery.of(context).size.height * 0.06;
    final screenSizeHeightHalf = MediaQuery.of(context).size.height * 0.60;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {}, // Icono dentro del botón flotante
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add), // Color de fondo del botón flotante
        ),
        body: BlocProvider.value(
          value: Modular.get<bloc.HomeBloc>()
            ..add(bloc.LoadInitialEvent())
            ..add(bloc.GetInfoCovidEvent())
            ..add(bloc.GetInfoDeviceEvent()),
          child: Stack(
            children: [
              Positioned(
                right: -40,
                top: -70,
                child: SizedBox(
                  child: Image.asset(
                    'assets/personaje-masculino.jpg',
                  ),
                ),
              ),
              Container(),
              SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  'assets/vector.webp',
                ),
              ),
              Positioned(
                bottom: 1,
                child: Container(
                  width: screenSizeWidth,
                  height: screenSizeHeightHalf,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.grey[400]!,
                        Colors.grey[400]!,
                        Colors.grey[350]!,
                        Colors.grey[100]!,
                      ],
                      stops: const [0.0, 0.33, 0.66, 1.0],
                    ),
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 4, bottom: 10, right: 4),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            S.current.covidProject,
                            style: const TextStyle(fontSize: 12),
                            overflow:
                                TextOverflow.visible, // O TextOverflow.ellipsis
                            maxLines: null, // Permitir múltiples líneas
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InfoDeviveSecctionWidget(
                screenSizeHeight: screenSizeHeight,
                screenSizeWidth: screenSizeWidth,
              ),
              Positioned(
                top: 15,
                right: 15,
                child: InkWell(
                  onTap: () {
                    Modular.to.pushReplacementNamed(
                      '/login',
                    );
                  },
                  child: const Icon(
                    Icons.output_outlined,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoDeviveSecctionWidget extends StatelessWidget {
  const InfoDeviveSecctionWidget({
    super.key,
    required this.screenSizeHeight,
    required this.screenSizeWidth,
  });

  final double screenSizeHeight;
  final double screenSizeWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenSizeHeight,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 200,
                width: screenSizeWidth,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: -12,
                        blurRadius: 7,
                        offset: const Offset(0, 1),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: -12,
                        blurRadius: 7,
                        offset: const Offset(0, -1),
                      ),
                    ],
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    margin: const EdgeInsets.all(12),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          BlocBuilder<bloc.HomeBloc, bloc.HomeState>(
                            builder: (context, state) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextBoxHourWidget(),
                                  ItemDeviceInfo(
                                    tittle: S.current.deviceBrand,
                                    data: state.homeModel.infoDevice == null
                                        ? ''
                                        : state.homeModel.infoDevice!.marca
                                            .toUpperCase(),
                                  ),
                                  ItemDeviceInfo(
                                    tittle: S.current.deviceModel,
                                    data: state.homeModel.infoDevice == null
                                        ? ''
                                        : state.homeModel.infoDevice!.modelo
                                            .toUpperCase(),
                                  ),
                                ],
                              );
                            },
                          ),
                          BlocBuilder<bloc.HomeBloc, bloc.HomeState>(
                            builder: (context, state) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ItemDeviceInfo(
                                    tittle: S.current.name,
                                    data: state.homeModel.infoDevice == null
                                        ? ''
                                        : state.homeModel.infoDevice!.nombre
                                            .toUpperCase(),
                                  ),
                                  ItemDeviceInfo(
                                    tittle: S.current.deviceType,
                                    data: state.homeModel.infoDevice == null
                                        ? ''
                                        : state.homeModel.infoDevice!.tipo
                                            .toUpperCase(),
                                  ),
                                  ItemDeviceInfo(
                                    tittle: S.current.operatingSystem,
                                    data:
                                        '${state.homeModel.infoDevice == null ? '' : state.homeModel.infoDevice!.sistemaOperativo.toUpperCase()} V.${state.homeModel.infoDevice == null ? '' : state.homeModel.versionMobile!}',
                                  ),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const DataCovidSecctionWidget(),
            ],
          ),
          const Positioned(
            right: 20,
            top: 170,
            child: BtnThemeApp(),
          )
        ],
      ),
    );
  }
}
