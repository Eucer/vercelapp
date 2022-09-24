import 'package:flutter/material.dart';
import 'package:v1douvery/NAV/mobiles/bottomNavSearchTitle.dart';
import 'package:v1douvery/NAV/mobiles/topTitleButtom.dart';
import 'package:v1douvery/constantes/global_variables.dart';

class Cargin extends StatelessWidget {
  const Cargin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //SelectBody
      body: Column(
        children: [
          Cargando(),
        ],
      ),
    );
  }
}

class Cargando extends StatelessWidget {
  const Cargando({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Cargando ...'),
      ),
    );
  }
}
