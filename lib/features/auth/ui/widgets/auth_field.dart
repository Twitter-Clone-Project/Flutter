import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../theme/app_colors.dart';

class AuthField extends ConsumerWidget {
  const AuthField( {
    super.key,
    required this.labelText,
    this.controller,
    this.errorText,
    this.maxLength,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.onChange,
  });

  final TextEditingController? controller;
  final int? maxLength;
  final String labelText;
  final String? errorText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Color enabledColor = AppColors.borderDarkGray;
  final Color focusedColor = AppColors.primaryColor;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return TextFormField(
      controller: controller,
        maxLength: maxLength,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
          errorText: errorText,
          contentPadding: const EdgeInsets.all(18),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: enabledColor),
          ),
          border: const OutlineInputBorder(),
        ),
      validator: validator,
      onChanged: onChange,
    );
  }
}