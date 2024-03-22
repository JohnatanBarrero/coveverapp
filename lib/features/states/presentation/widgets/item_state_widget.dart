import 'package:coveverapp/features/states/domain/models/info_state_sumary_model.dart';
import 'package:coveverapp/generated/l10n.dart';
import 'package:coveverapp/shared/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemStateWidget extends StatelessWidget {
  const ItemStateWidget({super.key, required this.infoStateSumaryModel});
  final InfoStateSumaryModel infoStateSumaryModel;
  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat('#,##0', 'es');

    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(vertical: 6),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        border: Border.all(
          color: const Color(0xFF525659), // Color del borde
          width: 0.5, // Ancho del borde
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), // O el radio que desees
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7), // Color de la sombra
                  spreadRadius: 1, // Extensión de la sombra
                  blurRadius: 2, // Difuminado de la sombra
                  offset: const Offset(0, 1), // Desplazamiento de la sombra
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  150 / 2), // Esto hace que la imagen sea circular
              child: Image.network(
                  'https://flagpedia.net/data/us/w1160/${infoStateSumaryModel.state.toLowerCase()}.webp',
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill, loadingBuilder: (BuildContext context,
                      Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child; // Retorna la imagen principal si la carga ha finalizado
                } else {
                  return Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Skeleton(
                      height: 50,
                      width: 50,
                    ),
                  ); // Retorna un indicador de carga mientras la imagen se está descargando
                }
              }, errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/no_image.svg.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                );
              }),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  infoStateSumaryModel.name,
                  style:
                      Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                ),
                RichText(
                  text: TextSpan(
                    text: '${S.current.totalCases}:  ',
                    style:
                        Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                    children: [
                      TextSpan(
                        text: formatter
                            .format(infoStateSumaryModel.totalTestResults),
                        style: Theme.of(context).primaryTextTheme.bodyMedium!,
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '${S.current.lastUpdate}:  ',
                    style:
                        Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                    children: [
                      TextSpan(
                        text: infoStateSumaryModel.lastUpdateEt,
                        style: Theme.of(context).primaryTextTheme.bodyMedium!,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
