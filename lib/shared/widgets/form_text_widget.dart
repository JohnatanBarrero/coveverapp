import 'package:flutter/material.dart';

class FormTextWidget extends StatelessWidget {
  const FormTextWidget({
    Key? key,
    this.labelStyle,
    this.border,
    this.errorBorderStyle,
    required this.textLabel,
    this.textInputType = TextInputType.name,
    required this.onChanged,
    this.icon,
    this.onPressedIcon,
    this.obscureText = false,
    required this.onFieldSubmitted,
    required this.focusNode,
    this.validator,
  }) : super(key: key);

  final TextStyle? labelStyle;
  final OutlineInputBorder? border;
  final OutlineInputBorder? errorBorderStyle;
  final String textLabel;

  final TextInputType textInputType;
  final ValueChanged<String> onChanged;
  final IconData? icon;
  final VoidCallback? onPressedIcon;
  final bool obscureText;
  final ValueChanged<String> onFieldSubmitted;
  final FocusNode focusNode;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 2.0),
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
        TextFormField(
          focusNode: focusNode,
          style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                fontSize: 16,
              ),
          keyboardType: textInputType,
          textCapitalization: TextCapitalization.none,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText,
          onFieldSubmitted: (value) {
            onFieldSubmitted(value);
          },
          decoration: InputDecoration(
            suffixIcon: icon != null
                ? IconButton(
                    icon: Icon(icon),
                    onPressed: onPressedIcon,
                  )
                : null,
            filled: true,
            fillColor: Theme.of(context).colorScheme.onBackground,
            labelStyle: labelStyle,
            focusedBorder: border,
            enabledBorder: border,
            errorBorder: errorBorderStyle,
            focusedErrorBorder: errorBorderStyle,
            errorMaxLines: 1,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 1.0,
              horizontal: 6.0,
            ),
          ),
          validator: (value) {
            if (validator != null) {
              return validator!(value);
            }
            return null;
          },
          onChanged: (value) {
            onChanged(value);
          },
        ),
      ],
    );
  }
}
//  validator: (value) {
//             if ((value ?? '').isEmpty) {
//               return textError;
//             }
//             return null;
//           },

