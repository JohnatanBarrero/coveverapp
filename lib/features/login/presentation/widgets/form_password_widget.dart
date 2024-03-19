import 'package:coveverapp/generated/l10n.dart';
import 'package:coveverapp/shared/widgets/form_text_widget.dart';
import 'package:flutter/material.dart';

import 'package:coveverapp/shared/const/constants.dart';

class FormPasswordWidget extends StatelessWidget {
  const FormPasswordWidget({
    super.key,
    required this.focusNode,
    required this.onChanged,
    required this.onPressedIcon,
    required this.icon,
    required this.obscureText,
    required this.focusNode2,
    this.isConfirmPass = false, this.passOne, this.passTwo,
  });
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final VoidCallback onPressedIcon;
  final IconData icon;
  final bool obscureText;
  final FocusNode? focusNode2;
  final bool isConfirmPass;
  final String? passOne;
  final String? passTwo;

  @override
  Widget build(BuildContext context) {
    return FormTextWidget(
      validator: (value) {
        if ((value ?? '').isEmpty) {
          return   S.current.fieldpassInvalid;
        }
          if (passOne!=passTwo) {
          return S.current.passShouldBeSame;
        }
        return null;
      },
      onPressedIcon: onPressedIcon,
      focusNode: focusNode,
      onFieldSubmitted: (_) {
        if (focusNode2 == null) {
          return;
        } else {
          FocusScope.of(context).requestFocus(focusNode2);
        }
      },
      border: border,
      labelStyle: labelStyle,
      errorBorderStyle: errorBorderStyle,
      textLabel: isConfirmPass
          ? '${S.current.confirmPassword}:'
          : '${S.current.password}:',
      // textError: S.current.fieldpassInvalid,
      onChanged: (value) {
        onChanged(value);
      },
      icon: icon,
      obscureText: obscureText,
    );
  }
}
