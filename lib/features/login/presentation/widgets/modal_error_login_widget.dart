import 'package:coveverapp/generated/l10n.dart';
import 'package:coveverapp/shared/widgets/btn_general_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModalErrroLogingWidget extends StatelessWidget {
  const ModalErrroLogingWidget({super.key, required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 30.0),
        const Icon(
          Icons.error_outline_outlined,
          color: Color(0xFFEC7D33),
          size: 50,
        ),
        const SizedBox(height: 10.0),
        Text(
          S.current.invalidCredentials,
          style: Theme.of(context).primaryTextTheme.bodyLarge,
        ),
        const SizedBox(height: 8.0),
        Text(
          S.current.tryAgainOrRegister,
          textAlign: TextAlign.justify,
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium!
              .copyWith(fontSize: 14),
        ),
        const SizedBox(height: 20.0),
        BtnGeneralWidget(
          onPressed: onPressed,
          txt: S.current.registerUser,
        ),
        const SizedBox(height: 12.0),
        BtnGeneralWidget(
          onPressed: () {
            Modular.to.pop();
          },
          txt: S.current.tryAgain,
        ),
        const Divider(),
      ],
    );
  }
}
