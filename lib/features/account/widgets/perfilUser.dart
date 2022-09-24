import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../../../provider/theme.dart';

class PerfilUsuario extends StatelessWidget {
  const PerfilUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: currentTheme.isDarkTheme()
                  ? GlobalVariables.darkbackgroundColor
                  : GlobalVariables.backgroundColor,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/images/user.jpg"),
                                // picked file
                                fit: BoxFit.cover,
                              ),
                              color: Colors.red,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  user.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: currentTheme.isDarkTheme()
                                        ? GlobalVariables
                                            .text2darkbackgroundColor
                                        : GlobalVariables
                                            .text1WhithegroundColor,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 25),
                                  child: Text(
                                    'Super Usuario',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: currentTheme.isDarkTheme()
                                            ? GlobalVariables
                                                .text1darkbackgroundColor
                                            : Colors.black45),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: GestureDetector(
                          child: Icon(
                            Icons.ios_share_outlined,
                            color: currentTheme.isDarkTheme()
                                ? GlobalVariables.text1darkbackgroundColor
                                : GlobalVariables.colorTextGreylv180,
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPage(),
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                        child: PopupMenuButton(
                      color: currentTheme.isDarkTheme()
                          ? GlobalVariables.text1darkbackgroundColor
                          : GlobalVariables.colorTextGreylv180,
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text('Reportar'),
                        ),
                      ],
                    )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: currentTheme.isDarkTheme()
                                ? GlobalVariables.darkOFbackgroundColor
                                : Color(0xffe6f2ff),
                          ),
                          child: TextButton(
                            child: Text(
                              "Informacion",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.5,
                                  fontSize: 14,
                                  color: currentTheme.isDarkTheme()
                                      ? GlobalVariables.text1darkbackgroundColor
                                      : Color.fromARGB(255, 5, 68, 177)),
                            ),
                            onPressed: () async {},
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton(
                            child: Text(
                              "Contactos",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                                fontSize: 15,
                                color: currentTheme.isDarkTheme()
                                    ? GlobalVariables.text1darkbackgroundColor
                                    : GlobalVariables.text1WhithegroundColor,
                              ),
                            ),
                            onPressed: () async {},
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton(
                            child: Text(
                              "Report",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                                fontSize: 15,
                                color: currentTheme.isDarkTheme()
                                    ? GlobalVariables.text1darkbackgroundColor
                                    : GlobalVariables.text1WhithegroundColor,
                              ),
                            ),
                            onPressed: () async {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
