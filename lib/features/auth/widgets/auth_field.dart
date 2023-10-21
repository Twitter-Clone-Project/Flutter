import 'package:flutter/material.dart';
import 'package:x_clone/theme/palette.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.labelText,
    //required this.controller,
    this.errorText,
    this.maxLength,
  });

  //final TextEditingController controller;
  final int? maxLength;
  final String labelText;
  final String? errorText;
  final Color enabledColor = Palette.greyColor;
  final Color focusedColor = Palette.blueColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        // controller: controller,
        maxLength: maxLength,
        decoration: InputDecoration(
          labelText: labelText,
          errorText: errorText,
          contentPadding: const EdgeInsets.all(18),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: enabledColor),
          ),
          border: const OutlineInputBorder(),
          suffixIcon: Visibility(
            visible: errorText != null,
            child: const Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        ));
  }
}
