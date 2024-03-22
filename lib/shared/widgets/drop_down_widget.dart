import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    Key? key,
    required this.textLabel,
    this.value,
    required this.items,
    this.validator,
    required this.onChanged,
    required this.txtHint,
  }) : super(key: key);

  final String textLabel;
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final String? Function(String?)? validator;
  final ValueChanged<String> onChanged;
  final String txtHint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            textLabel,
            style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        DropdownButtonFormField<String>(
          focusColor: Colors.yellow,
          isExpanded: true,
          isDense: true,
          dropdownColor: Theme.of(context).cardTheme.color,
          items: items,
          icon: Icon(Icons.arrow_drop_down,
              size: 30.0,
              color: Theme.of(context).colorScheme.secondaryContainer),
          value: value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (validator != null) {
              return validator!(value);
            }
            return null;
          },
          decoration: InputDecoration(
            fillColor: Theme.of(context).colorScheme.onBackground,
            contentPadding: const EdgeInsets.symmetric(horizontal: 6),
            isDense: false,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Color(0xFFC9C6C8),
                width: 1.0,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
            filled: true,
          ),
          hint: Text(
            txtHint,
            style: Theme.of(context).primaryTextTheme.bodyMedium,
          ),
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.redAccent,
          ),
          onChanged: (value) {
            onChanged(value!);
          },
        ),
      ],
    );
  }
}
