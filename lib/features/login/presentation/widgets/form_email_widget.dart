import 'package:coveverapp/generated/l10n.dart';
import 'package:coveverapp/shared/utils/format_text.dart';
import 'package:coveverapp/shared/widgets/form_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:coveverapp/shared/const/constants.dart';

class FormEmailWidget extends StatelessWidget {
  const FormEmailWidget({
    super.key,
    required this.focusNode,
    required this.focusNode2,
    required this.onChanged,
  });
  final FocusNode focusNode;
  final FocusNode focusNode2;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return FormTextWidget(
      validator: (value) {
        if ((value ?? '').isEmpty) {
          return S.current.fieldEmailInvalid;
        } else {
          if (!FormatText.email(value!)) {
            return S.of(context).fieldEmailInvalid;
          }
        }
        return null;
      },
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(focusNode2);
      },
      border: border,
      labelStyle: labelStyle,
      errorBorderStyle: errorBorderStyle,
      textLabel: '${S.current.email}:',
      textInputType: TextInputType.emailAddress,
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
