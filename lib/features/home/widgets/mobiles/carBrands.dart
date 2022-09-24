import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/provider/theme.dart';

class CardBrands extends StatelessWidget {
  const CardBrands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        padding: EdgeInsets.all(8),
        color: currentTheme.isDarkTheme()
            ? GlobalVariables.darkbackgroundColor
            : GlobalVariables.backgroundColor,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(right: 8.0),
                  child: Text(
                    'Reporta tu experiencia con douvery...',
                    style: TextStyle(
                        color: currentTheme.isDarkTheme()
                            ? GlobalVariables.text1darkbackgroundColor
                            : GlobalVariables.text1WhithegroundColor,
                        fontSize: 14),
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('Ver'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
