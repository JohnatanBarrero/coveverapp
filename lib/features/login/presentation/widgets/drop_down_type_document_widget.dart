import 'package:coveverapp/features/login/domain/models/enum_type_document.dart';
import 'package:coveverapp/generated/l10n.dart';
import 'package:coveverapp/shared/widgets/drop_down_widget.dart';
import 'package:flutter/material.dart';

class DropDownTypeDocumentWidget extends StatelessWidget {
  const DropDownTypeDocumentWidget({
    super.key,
    required this.value,
    required this.onChanged,
    this.validator,
  });

  final ValueChanged<String> onChanged;
  final String? value;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    List<EnumTypeDocument> ltsTypeDocument = EnumTypeDocument.values;
    return DropDownWidget(
      value: value,
      textLabel: '${S.current.typeDocument}:',
      items: List.generate(
        ltsTypeDocument.length,
        (i) => DropdownMenuItem<String>(
          value: ltsTypeDocument[i].type.toString(),
          child: Text(
            ltsTypeDocument[i].txtToShow.toString(),
            overflow: TextOverflow.visible,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontFamily: 'Raleway',
            ),
            textAlign: TextAlign.left,
            maxLines: 3,
          ),
        ),
      ).toList(),
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      onChanged: onChanged,
      txtHint: S.current.selectAtypedocument,
    );
  }
}
