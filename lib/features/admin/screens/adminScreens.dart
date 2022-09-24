import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/mobiles/bottomNavSearchTitle.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/NAV/mobiles/topTitleButtom.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/admin/widgests/NAV/AdmintopTitleButtom.dart';
import 'package:v1douvery/features/admin/widgests/NAV/centerSearchNav.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../../../provider/theme.dart';
import '../../Drawer/screen/mobiles_drawerScreen.dart';
import '../widgests/postsScreens.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    PostsScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final currentTheme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Color(
                0XFF0D3B66,
              ),
              flexibleSpace: Container(),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.admin_panel_settings),
                        Text(
                          user.name,
                          style: GoogleFonts.lato(
                            color: Color(0xffFCFCFC),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              toolbarHeight: 60,
            ),
            ContainerNavOpci(),
          ],
        ),
      ),
      drawer: DrawerScreen(),
      body: pages[_page],
    );
  }
}

class ContainerNavOpci extends StatelessWidget {
  const ContainerNavOpci({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);

    return Container(
      color: currentTheme.isDarkTheme()
          ? GlobalVariables.darkbackgroundColor
          : Color(0xff19323C),
      height: 30,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  right: 15.0,
                  left: 20,
                ),
                child: Text(
                  'Articulos',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  'Ropas para bebes',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  'Hogar',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(
                  'Tecnología',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContainerPROD extends StatelessWidget {
  const ContainerPROD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalVariables.appBarbackgroundColor,
      height: 30,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  right: 15.0,
                  left: 10,
                ),
                child: Text(
                  'Articulos',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  'Ropas para bebes',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  'Hogar',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(
                  'Tecnología',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
