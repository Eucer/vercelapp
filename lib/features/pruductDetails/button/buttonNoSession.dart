import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/auth/responsive/authResponsivelayout.dart';

class ButtomAggCartNosessions extends StatelessWidget {
  const ButtomAggCartNosessions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Color(0xff1a49ab), // background
        // foreground
      ),
      onPressed: () {
        ElegantNotification.info(
          width: 500,
          title: Text("Info"),
          description: Text('Upps... parece que no has iniciado session '),
          animationDuration: const Duration(milliseconds: 200),
          toastDuration: const Duration(milliseconds: 3500),
        ).show(context);
        ;
      },
      icon: Icon(
        IconlyLight.buy,
        size: 16,
        color: Colors.white,
      ),
      label: Text(
        "Añadir al Carrito",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
