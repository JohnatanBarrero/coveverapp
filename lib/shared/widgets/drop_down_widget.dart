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
            style: const TextStyle(
              color: Colors.black,
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
          dropdownColor: Colors.white,
          items: items,
          icon: const Icon(
            Icons.arrow_drop_down,
            size: 30.0,
            color: Colors.black,
          ),
          value: value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (validator != null) {
            return  validator!(value);
            }
            return null;
          },
          decoration: const InputDecoration(
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 6),
            isDense: false,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Color(0xFFC9C6C8),
                width: 1.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
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
            style: const TextStyle(),
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
