import 'package:flutter/material.dart';
import 'package:v1douvery/constantes/global_variables.dart';

class NotSessions extends StatelessWidget {
  const NotSessions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            'Upps ... Parece que no has iniciado session!',
            style: TextStyle(color: GlobalVariables.colorTextBlckLight),
          ),
        ),
      ],
    );
  }
}
