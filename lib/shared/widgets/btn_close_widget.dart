import 'package:coveverapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CloseBtnWidget extends StatelessWidget {
  const CloseBtnWidget({
    super.key, required this.weight,
  });
final double weight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:weight ,
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
          onPressed: () => Modular.to.pop(),
          child: Text(
            S.current.close,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
