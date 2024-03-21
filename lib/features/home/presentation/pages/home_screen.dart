import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:coveverapp/features/home/presentation/blocs/bloc/home_bloc.dart'
    as bloc;
export 'package:coveverapp/features/home/presentation/blocs/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = "${now.hour}:${now.minute}:${now.second}";
    final screenSizeWidth = MediaQuery.of(context).size.width;
    final screenSizeHeight = MediaQuery.of(context).size.height * 0.30;
    List<String> strings = [formattedTime, 'Dos', 'Tres', 'Cuatro', 'Cinco'];
    return SafeArea(
      child: Scaffold(
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
                  top: -10,
                  child: SizedBox(
                    child: Image.asset(
                      'assets/personaje-masculino.jpg',
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Welcome to home my friend',
                  ),
                ),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    'assets/vector.webp',
                  ),
                ),
                Positioned(
                  top: screenSizeHeight,
                  child: SizedBox(
                    height: 200,
                    width: screenSizeWidth,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        margin: EdgeInsets.all(12),
                        elevation: 10,

                        // Dentro de esta propiedad usamos ClipRRect
                        child: ClipRRect(
                          // Los bordes del contenido del card se cortan usando BorderRadius
                          borderRadius: BorderRadius.circular(30),

                          // EL widget hijo que será recortado segun la propiedad anterior
                          child: Center(
                            child: GridView.count(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                children: List.generate(
                                  strings.length,
                                  (index) => Container(
                                    decoration:
                                        BoxDecoration(color: Colors.amber),
                                    child: Text(
                                      strings[index],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                )),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
