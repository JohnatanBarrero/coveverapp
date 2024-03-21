import 'package:coveverapp/shared/widgets/skeleton.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:coveverapp/features/home/presentation/blocs/bloc/home_bloc.dart'
    as bloc;
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
          child: BlocListener<bloc.HomeBloc, bloc.HomeState>(
            listener: (context, state) {
              // TODO: implement listener
            },
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
                            padding:
                                EdgeInsets.only(left: 4, bottom: 10, right: 4),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'El proyecto COVID Tracking ha finalizado toda recopilación de datos a partir del 7 de marzo de 2021',
                              style: TextStyle(fontSize: 10),
                              overflow: TextOverflow
                                  .visible, // O TextOverflow.ellipsis
                              maxLines: null, // Permitir múltiples líneas
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
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
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextBoxHourWidget(),
                                          BrandDevice(),
                                          ModelDevice()
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          NemeDeviceWidget(),
                                          TypeDevice(),
                                          SystemDevice()
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const DataCovidWidget(),
                        ],
                      ),
                      Positioned(
                        right: 20,
                        top: 170,
                        child: BtnThemeApp(),
                      )
                    ],
                  ),
                ),
                // Positioned(
                //   right: 20,
                //   bottom: screenSizeHeightSixty,
                //   child: BtnThemeApp(),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DateData extends StatelessWidget {
  const DateData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.HomeBloc, bloc.HomeState>(
      builder: (context, state) {
        if (state is bloc.GettingInfoCovidState ||
            state is bloc.GettingInfoDeviceState ||
            state is bloc.InitialState ||
            state.homeModel.infoCovidModel == null) {
          return const Skeleton(
            width: 50,
            height: 20,
          );
        }
        return Text(
          'Fecha de recolección Datos: ${DateFormat('dd.MM.yyyy').format(
            DateTime.parse(state.homeModel.infoCovidModel!.dateChecked),
          )}',
          style: TextStyle(
            color: Color(0xFF525659),
            letterSpacing: 1,
            fontFamily: GoogleFonts.openSans().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}

class DataCovidWidget extends StatelessWidget {
  const DataCovidWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          const DateData(),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<bloc.HomeBloc, bloc.HomeState>(
                builder: (context, state) {
                  if (state is bloc.GettingInfoCovidState ||
                      state is bloc.GettingInfoDeviceState ||
                      state is bloc.InitialState ||
                      state.homeModel.infoCovidModel == null) {
                    return const Skeleton(
                      width: 50,
                      height: 20,
                    );
                  }
                  return Column(
                    children: [
                      BoxDataWidget(
                        tittle: 'Casos totales',
                        data: state.homeModel.infoCovidModel!.totalTestResults,
                      ),
                      BoxDataWidget(
                        tittle: 'Pruebas negativas',
                        data: state.homeModel.infoCovidModel!.negative,
                      ),
                      BoxDataWidget(
                        tittle: 'Fallecidos',
                        data: state.homeModel.infoCovidModel!.death,
                      ),
                      BoxDataWidget(
                        tittle: 'Pruebas pendientes',
                        data: state.homeModel.infoCovidModel!.pending,
                      )
                    ],
                  );
                },
              ),
              BlocBuilder<bloc.HomeBloc, bloc.HomeState>(
                builder: (context, state) {
                  if (state is bloc.GettingInfoCovidState ||
                      state is bloc.GettingInfoDeviceState ||
                      state is bloc.InitialState ||
                      state.homeModel.infoCovidModel == null) {
                    return const Skeleton(
                      width: 50,
                      height: 20,
                    );
                  }
                  return Column(
                    children: [
                      BoxDataWidget(
                        tittle: 'Casos confirmados',
                        data: state
                            .homeModel.infoCovidModel!.totalTestResultsIncrease,
                      ),
                      BoxDataWidget(
                        tittle: 'Pruebas positivas',
                        data: state.homeModel.infoCovidModel!.positive,
                      ),
                      BoxDataWidget(
                        tittle: 'Recuperados',
                        data: state.homeModel.infoCovidModel!.recovered ?? 0,
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BoxDataWidget extends StatelessWidget {
  const BoxDataWidget({super.key, required this.tittle, required this.data});

  final String tittle;
  final int data;
  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat('#,##0', 'es');
    return Container(
      height: 65,
      width: 155,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            formatter.format(data),
            style: TextStyle(
              color: const Color(0xFF525659),
              letterSpacing: 0.5,
              fontFamily: GoogleFonts.openSans().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            tittle,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[400],
              letterSpacing: 0.5,
              fontFamily: GoogleFonts.openSans().fontFamily,
            ),
          )
        ],
      ),
    );
  }
}

class TextBoxHourWidget extends StatelessWidget {
  const TextBoxHourWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('HH:mm:ss').format(now);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
                text: formattedTime,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: Color(0xFF525659),
                ),
                children: const [
                  TextSpan(
                    text: 'pm',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromARGB(255, 71, 71, 71),
                    ),
                  )
                ]),
          ),
          Text(
            'Fecha actual',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Color(0xFF525659),
            ),
          )
        ]);
  }
}

class NemeDeviceWidget extends StatelessWidget {
  const NemeDeviceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.HomeBloc, bloc.HomeState>(
      builder: (context, state) {
        if ((state is bloc.GettingInfoCovidState ||
            state is bloc.GettingInfoDeviceState ||
            state is bloc.InitialState)) {
          return const Skeleton(
            width: 50,
            height: 20,
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre del dispositivo',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            Text(
              state.homeModel.infoDevice!.nombre.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        );
      },
    );
  }
}

class BrandDevice extends StatelessWidget {
  const BrandDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.HomeBloc, bloc.HomeState>(
      builder: (context, state) {
        if (state is bloc.GettingInfoCovidState ||
            state is bloc.GettingInfoDeviceState ||
            state is bloc.InitialState) {
          return const Skeleton(
            width: 50,
            height: 20,
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Marca del dispositivo',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            Text(
              state.homeModel.infoDevice!.marca.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        );
      },
    );
  }
}

class TypeDevice extends StatelessWidget {
  const TypeDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.HomeBloc, bloc.HomeState>(
      builder: (context, state) {
        if (state is bloc.GettingInfoCovidState ||
            state is bloc.GettingInfoDeviceState ||
            state is bloc.InitialState) {
          return const Skeleton(
            width: 50,
            height: 20,
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tipo de dispositivo',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            Text(
              state.homeModel.infoDevice!.tipo.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        );
      },
    );
  }
}

class ModelDevice extends StatelessWidget {
  const ModelDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.HomeBloc, bloc.HomeState>(
      builder: (context, state) {
        if (state is bloc.GettingInfoCovidState ||
            state is bloc.GettingInfoDeviceState ||
            state is bloc.InitialState) {
          return const Skeleton(
            width: 50,
            height: 20,
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Modelo del dispositivo',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              state.homeModel.infoDevice!.modelo.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        );
      },
    );
  }
}

class SystemDevice extends StatelessWidget {
  const SystemDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.HomeBloc, bloc.HomeState>(
      builder: (context, state) {
        if (state is bloc.GettingInfoCovidState ||
            state is bloc.GettingInfoDeviceState ||
            state is bloc.InitialState) {
          return const Skeleton(
            width: 50,
            height: 20,
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sistema operativo y su version',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            Text(
              '${state.homeModel.infoDevice!.sistemaOperativo.toUpperCase()} V.${state.homeModel.versionMobile!}',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        );
      },
    );
  }
}

class BtnThemeApp extends StatelessWidget {
  const BtnThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey, // Color del borde
              width: 2, // Ancho del borde
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: NeumorphicButton(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(4),
            onPressed: () {},
            style: const NeumorphicStyle(
              color: Colors.white,
              shape: NeumorphicShape.concave,
              depth: 2,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            child: const Icon(Icons.light_mode),
          ),
        ),
        Container(
          width: 50,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(
              color: Colors.grey, // Color del borde
              width: 2, // Ancho del borde
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: NeumorphicButton(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(4),
              onPressed: () {
                // Cambiar al tema oscuro
              },
              style: const NeumorphicStyle(
                color: Colors.grey,
                shape: NeumorphicShape.concave,
                depth: 2,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              child: const Icon(Icons.nightlight_outlined)),
        ),
      ],
    );
  }
}
