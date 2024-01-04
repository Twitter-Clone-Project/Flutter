import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    required this.suffixIcon,
    this.controller,
    this.hintStyle,
    required this.color,
    this.obscureText = false,
    this.textInputType = TextInputType.text, this.validator, this.textDirection,
  }) : super(key: key);

  final TextInputType textInputType;
  final String hintText;
  final TextStyle? hintStyle;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;
  final Widget suffixIcon;
  final bool obscureText;
  final Color color;
  final TextEditingController? controller;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: textInputType,
      obscureText: obscureText,
      controller: controller,
      textDirection: textDirection??TextDirection.ltr,

      decoration: InputDecoration(
          suffixIcon:suffixIcon,
          filled: true,
          fillColor:color,
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: prefixIcon,
          enabledBorder: buildOutlineInputBorder(
            borderColor: Color(0xffE8E8E8),
          ),
          focusedBorder: buildOutlineInputBorder(borderColor: AppColors.primaryColor)
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color borderColor = const  Color(0xFFF7F7F7)}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 1,
        color: borderColor,
      ),
    );
  }
}
