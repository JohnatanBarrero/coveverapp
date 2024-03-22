import 'package:coveverapp/generated/l10n.dart';
import 'package:coveverapp/shared/widgets/form_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:coveverapp/shared/const/constants.dart';

class FormNumberDocumentWidget extends StatelessWidget {
  const FormNumberDocumentWidget({
    super.key,
    required this.focusNode,
    required this.focusNode2,
    required this.onChanged,
  });
  final FocusNode focusNode;
  final FocusNode? focusNode2;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return FormTextWidget(
      validator: (value) {
        if ((value ?? '').isEmpty) {
          return S.current.fieldNameInvalid;
        }
        return null;
      },
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
      textLabel: '${S.current.numberDocument}:',
      textInputType: TextInputType.number,
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
