import 'package:coveverapp/shared/widgets/skeleton.dart';
import 'package:flutter/material.dart';
class ItemDeviceInfo extends StatelessWidget {
  const ItemDeviceInfo({super.key, required this.tittle, required this.data});

  final String tittle;
  final String data;
  @override
  Widget build(BuildContext context) {
    return data == ''
        ? const Skeleton(
            width: 50,
            height: 20,
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tittle, //  'Marca del dispositivo',
                style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                data, // state.homeModel.infoDevice!.marca.toUpperCase(),
                style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          );
  }
}
