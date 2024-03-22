import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:coveverapp/config/main/bloc/bloc.dart' as main_bloc;
import 'package:flutter_bloc/flutter_bloc.dart';

class BtnThemeApp extends StatelessWidget {
  const BtnThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<main_bloc.Bloc, main_bloc.State>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                border: Border.all(
                  color: const Color(0xFF525659), // Color del borde
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
                onPressed: () {
                  ReadContext(context).read<main_bloc.Bloc>().add(
                        main_bloc.ChangedThemeAppEvent(),
                      );
                },
                style: NeumorphicStyle(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  shape: NeumorphicShape.concave,
                  depth: 2,
                  boxShape: const NeumorphicBoxShape.circle(),
                ),
                child: Icon(
                  Icons.light_mode,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
            ),
            Container(
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer, // Color del borde
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
                    ReadContext(context).read<main_bloc.Bloc>().add(
                          main_bloc.ChangedThemeAppEvent(),
                        );
                  },
                  style: NeumorphicStyle(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    shape: NeumorphicShape.concave,
                    depth: 2,
                    boxShape:const  NeumorphicBoxShape.circle(),
                  ),
                  child: Icon(
                    Icons.nightlight_outlined,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  )),
            ),
          ],
        );
      },
    );
  }
}
