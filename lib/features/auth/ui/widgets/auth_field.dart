import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../theme/app_colors.dart';

/// A custom text input field for authentication purposes.
///
/// This widget provides a text input field commonly used in authentication forms.
/// It includes features such as label text, error text, maximum length, validation,
/// and the ability to obscure the entered text.
///
/// Example usage:
/// ```dart
/// AuthField(
///   labelText: 'Email',
///   controller: _emailController,
///   validator: (value) {
///     if (value == null || value.isEmpty) {
///       return 'Please enter your email';
///     }
///     return null;
///   },
///   onChange: (value) {
///     // Handle email input change
///   },
/// )
/// ```
class AuthField extends ConsumerWidget {
  const AuthField({
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

  /// The controller for the text field.
  ///
  /// This controller can be used to retrieve the current value of the text field
  /// or to set a new value programmatically.
  final TextEditingController? controller;

  /// The maximum number of characters allowed in the text field.
  final int? maxLength;

  /// The label text displayed above the text field.
  final String labelText;

  /// The error text displayed below the text field when validation fails.
  final String? errorText;

  /// Whether the entered text should be obscured (e.g., for password fields).
  final bool obscureText;

  /// An optional widget to display as a suffix icon in the text field.
  final Widget? suffixIcon;
  final Color enabledColor = AppColors.borderDarkGray;
  final Color focusedColor = AppColors.primaryColor;
  final String? Function(String?)? validator;

  /// The function called when the text field's value changes.
  ///
  /// This function takes the new value of the text field as input.
  final String? Function(String?)? onChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
