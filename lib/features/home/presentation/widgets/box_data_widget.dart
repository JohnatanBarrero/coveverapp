import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(formatter.format(data),
              style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  )),
          Text(
            tittle,
            style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                fontFamily: GoogleFonts.openSans().fontFamily,
                letterSpacing: 0.5,
                color: Colors.grey[400]),
          )
        ],
      ),
    );
  }
}
