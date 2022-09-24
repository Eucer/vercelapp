import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constantes/global_variables.dart';
import '../../provider/theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: currentTheme.isDarkTheme()
            ? GlobalVariables.text1darkbackgroundColor
            : GlobalVariables.text1WhithegroundColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: currentTheme.isDarkTheme()
                ? GlobalVariables.text1darkbackgroundColor
                : Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme()
                ? GlobalVariables.borderColorsDarklv10
                : Colors.black45,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme()
                ? GlobalVariables.borderColorsDarklv10
                : Colors.black38,
          ),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter You $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
