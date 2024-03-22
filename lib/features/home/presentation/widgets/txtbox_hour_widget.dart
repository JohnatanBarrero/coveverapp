import 'package:coveverapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            children: [
              TextSpan(
                text: 'pm',
                style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(
                      fontSize: 16,
                    ),
              )
            ],
          ),
        ),
        Text(
          S.current.dateCurrently,
          style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }
}
