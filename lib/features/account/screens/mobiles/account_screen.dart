import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/mobiles/appBarIcons.dart';
import 'package:v1douvery/NAV/mobiles/bottomNavSearchTitle.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/NAV/mobiles/topTitleButtom.dart';

import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/Nosession.dart';
import 'package:v1douvery/features/account/widgets/categoriasUser.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/account/widgets/perfilUser.dart';
import 'package:v1douvery/features/account/widgets/WelcomeUser.dart';
import 'package:v1douvery/features/auth/screens/auth_screen.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../../../../provider/theme.dart';
import '../../../Drawer/screen/mobiles_drawerScreen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: currentTheme.isDarkTheme()
          ? GlobalVariables.darkOFbackgroundColor
          : GlobalVariables.greyBackgroundCOlor,
      drawer: DrawerScreen(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(105),
        child: Center(
          child: AppBarIcons(),
        ),
      ),

      //SelectBody
      body: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Session()
          : Nosession(),
    );
  }
}

class Session extends StatelessWidget {
  const Session({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          WelcomeUser(),
          CategoriasUser(),
          PerfilUsuario(),
          OrdersUser(),
        ],
      ),
    );
  }
}

class Nosession extends StatelessWidget {
  const Nosession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          color: currentTheme.isDarkTheme()
              ? GlobalVariables.darkbackgroundColor
              : GlobalVariables.backgroundColor,
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/gifUserAccount.gif",
                height: 125.0,
                width: 125.0,
              ),
              NotSessions(),
              Container(
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.darkbackgroundColor
                    : GlobalVariables.backgroundColor,
                alignment: Alignment.center,
                child: IconButton(
                  icon: GestureDetector(
                    child: Icon(
                      IconlyLight.login,
                      color: currentTheme.isDarkTheme()
                          ? GlobalVariables.colorRosaRojVivo
                          : GlobalVariables.colorRosaRojVivo,
                    ),
                    onTap: () =>
                        Navigator.of(context, rootNavigator: true).push(
                      // ensures fullscreen
                      CupertinoPageRoute(
                        builder: (BuildContext context) {
                          return AuthScreen();
                        },
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
