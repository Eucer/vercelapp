import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/mobiles/appBarIcons.dart';
import 'package:v1douvery/NAV/mobiles/bottomNavSearchTitle.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/NAV/mobiles/topTitleButtom.dart';
import 'package:v1douvery/NAV/web/Web_appBarIcons.dart';
import 'package:v1douvery/NAV/web/Web_bottomNavSearchTitle.dart';

import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/Nosession.dart';
import 'package:v1douvery/features/account/widgets/categoriasUser.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/account/widgets/perfilUser.dart';
import 'package:v1douvery/features/account/widgets/WelcomeUser.dart';
import 'package:v1douvery/features/account/widgets/webFull/webFull_ordenesUser.dart';
import 'package:v1douvery/features/account/widgets/webFull/webFull_categoriasUser.dart';
import 'package:v1douvery/features/account/widgets/webFull/webFull_perfilUser.dart';
import 'package:v1douvery/features/auth/responsive/authResponsivelayout.dart';
import 'package:v1douvery/features/auth/screens/auth_screen.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../../../../provider/theme.dart';

class WebFullAccountScreen extends StatelessWidget {
  const WebFullAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(75),
            child: Center(
              child: Web_AppBarIcons(),
            ),
          ),
          body: Provider.of<UserProvider>(context).user.token.isNotEmpty
              ? Session()
              : Nosession(),
        ));

    //SelectBody
  }
}

class Session extends StatelessWidget {
  const Session({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: currentTheme.isDarkTheme()
          ? GlobalVariables.darkOFbackgroundColor
          : GlobalVariables.greyBackgroundCOlor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebFull_NavCategory(),
            Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width / 1.3,
              height: 800,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WebFullPerfilUsuario(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: GlobalVariables.backgroundColor,
                    ),
                    margin: EdgeInsets.only(top: 10),
                    width: 1000,
                    height: 770,
                    child: Column(
                      children: [
                        WebFullCategoriasUser(),
                        WebFullOrdersUser(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Nosession extends StatelessWidget {
  const Nosession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebFull_NavCategory(),
            NotSessions(),
            Container(
              child: IconButton(
                icon: GestureDetector(
                  child: Icon(
                    IconlyLight.login,
                    color: GlobalVariables.colorRosaRojVivo,
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebFullResponsiveLayaout(),
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
