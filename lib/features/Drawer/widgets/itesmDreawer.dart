import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constantes/global_variables.dart';
import '../../../provider/theme.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key,
      required this.name,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      color: currentTheme.isDarkTheme()
          ? GlobalVariables.darkbackgroundColor
          : GlobalVariables.backgroundColor,
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 40,
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.text1darkbackgroundColor
                    : GlobalVariables.text1WhithegroundColor,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 17,
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.text1darkbackgroundColor
                      : GlobalVariables.text1WhithegroundColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
