import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget headerText({
  String texto = '',
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.w500,
  double fontSize = 16,
}) {
  return Text(
    texto,
    style: GoogleFonts.openSans(
        color: color, fontWeight: fontWeight, fontSize: fontSize),
    textAlign: TextAlign.start,
  );
}
