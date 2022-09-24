import 'package:flutter/material.dart';
import 'package:v1douvery/common/widgets/header_text.dart';

Widget headerDoubleText(
    {required String textHeader, required String textAction}) {
  return Row(
    children: [
      headerText(
        texto: textHeader,
        color: Color(0xff212121),
        fontWeight: FontWeight.w400,
        fontSize: 15.0,
      ),
      Spacer(),
      GestureDetector(
        child: headerText(
            texto: textAction,
            color: Color(0xff2155CD),
            fontWeight: FontWeight.w400,
            fontSize: 14.0),
        onTap: () {},
      ),
    ],
  ); // Container
}
