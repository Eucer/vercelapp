import 'package:flutter/material.dart';
import 'package:v1douvery/common/widgets/header_text.dart';

Widget headerBoldText(
    {required String textHeader, required String textAction}) {
  return Row(
    children: [
      headerText(
        texto: textHeader,
        color: Color(0xff000000),
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      ),
      const Spacer(),
      GestureDetector(
          child: headerText(
              texto: textAction,
              color: Color(0xff2155CD),
              fontWeight: FontWeight.w400,
              fontSize: 14.0))
    ],
  ); // Container
}
