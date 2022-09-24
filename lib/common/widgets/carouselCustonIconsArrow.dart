import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/constantes/global_variables.dart';

class CarouselconsButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;

  const CarouselconsButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(204, 44, 44, 44)
                  .withOpacity(0.2), //color of shadow
              spreadRadius: 1, //spread radius
              blurRadius: 2, // blur radius
              offset: Offset(0, 1), // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            ),
            //you can set more BoxShadow() here
          ],
          color: GlobalVariables.backgroundColor),
      child: CustomnIconsButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
