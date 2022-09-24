import 'package:flutter/material.dart';
import 'package:v1douvery/constantes/global_variables.dart';

class CustomnButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomnButton(
      {Key? key, required this.text, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          double.infinity,
          50,
        ),
        primary: color,
      ),
    );
  }
}
