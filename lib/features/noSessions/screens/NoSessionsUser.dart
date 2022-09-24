import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constantes/global_variables.dart';
import '../../../provider/theme.dart';

class NoSessionsUser extends StatelessWidget {
  const NoSessionsUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: currentTheme.isDarkTheme()
            ? GlobalVariables.darkOFbackgroundColor
            : GlobalVariables.greyBackgroundCOlor,
        width: MediaQuery.of(context).size.width,
        height: 500,
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: Text(
              'Modificar ...',
              style: TextStyle(
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.text1darkbackgroundColor
                      : GlobalVariables.text1WhithegroundColor),
            ),
          ),
        ]),
      ),
    );
  }
}
