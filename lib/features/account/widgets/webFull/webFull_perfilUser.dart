import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/common/widgets/header_text.dart';

import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';
import 'package:v1douvery/models/themePreference.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../../../../provider/theme.dart';
import '../WelcomeUser.dart';

class WebFullPerfilUsuario extends StatelessWidget {
  const WebFullPerfilUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 400,
            height: 770,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: currentTheme.isDarkTheme()
                  ? GlobalVariables.darkbackgroundColor
                  : GlobalVariables.backgroundColor,
            ),
            child: Column(
              children: [
                WelcomeUser(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 60, bottom: 5),
                                  child: Text(
                                    user.name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 25),
                                  child: Text(
                                    'Super Usuario',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black45),
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
                            color: GlobalVariables.colorTextGreylv180,
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
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Container(
                            width: 200,
                            height: 100,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 550,
                    child: ContainedTabBarView(
                      tabBarProperties: const TabBarProperties(),
                      tabs: [
                        Text(
                          'Datos',
                          style: TextStyle(
                            fontSize: 14,
                            color: GlobalVariables.colorTextGreylv180,
                          ),
                        ),
                        Text(
                          'Contacts',
                          style: TextStyle(
                            fontSize: 14,
                            color: GlobalVariables.colorTextGreylv180,
                          ),
                        ),
                        Text(
                          'Report User',
                          style: TextStyle(
                            fontSize: 14,
                            color: GlobalVariables.colorTextGreylv180,
                          ),
                        ),
                      ],
                      views: [
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 8),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: Text(
                                  'Informacion',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: GlobalVariables.colorTextBlckBold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Id :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Color.fromARGB(230, 0, 0, 0)),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      user.id,
                                      style: TextStyle(
                                          color: Color.fromARGB(180, 0, 0, 0)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Nombre :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Color.fromARGB(230, 0, 0, 0)),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      user.name,
                                      style: TextStyle(
                                          color: Color.fromARGB(180, 0, 0, 0)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Direccion :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Color.fromARGB(230, 0, 0, 0)),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      user.email,
                                      style: TextStyle(
                                          color: Color.fromARGB(180, 0, 0, 0)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Tipo de usuario :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Color.fromARGB(230, 0, 0, 0)),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      user.type,
                                      style: TextStyle(
                                          color: Color.fromARGB(180, 0, 0, 0)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Address :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Color.fromARGB(230, 0, 0, 0)),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      user.address,
                                      style: TextStyle(
                                          color: Color.fromARGB(180, 0, 0, 0)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.wb_sunny,
                                            color: currentTheme.isDarkTheme()
                                                ? Color.fromARGB(104, 5, 5, 5)
                                                : Colors.white),
                                        Switch(
                                            value: currentTheme.isDarkTheme(),
                                            onChanged: (value) {
                                              String newTheme = value
                                                  ? ThemePreference.DARK
                                                  : ThemePreference.LIGHT;
                                              currentTheme.setTheme = newTheme;
                                            }),
                                        Icon(Icons.brightness_2,
                                            color: currentTheme.isDarkTheme()
                                                ? Colors.white
                                                : Color.fromARGB(104, 5, 5, 5))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(color: Colors.green),
                        Container(color: Colors.green),
                      ],
                      onChange: (index) => print(index),
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
