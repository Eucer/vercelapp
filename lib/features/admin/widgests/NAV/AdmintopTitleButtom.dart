import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:badges/badges.dart';
import 'package:v1douvery/constantes/global_variables.dart';

class AdminTopTitleButtom extends StatelessWidget {
  const AdminTopTitleButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppBar(
        elevation: 0,
        title: const Text(
          'Douvery ',
        ),
        backgroundColor: GlobalVariables.appBarbackgroundColor,
      ),
    );
  }
}
