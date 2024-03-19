import 'package:flutter/material.dart';

class BtnGeneralWidget extends StatelessWidget {
  const BtnGeneralWidget({
    Key? key,
    required this.txt,
    required this.onPressed,
  }) : super(key: key);

  final String txt;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonTheme(
            height: 45.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 5.0,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: onPressed,
              child: Text(
                txt,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
