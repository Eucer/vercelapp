import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/screens/mobiles/account_screen.dart';
import 'package:v1douvery/features/admin/screens/accountBrands.dart';
import 'package:v1douvery/features/admin/screens/adminScreens.dart';
import 'package:v1douvery/features/admin/screens/analtyScreen.dart';
import 'package:v1douvery/features/admin/screens/ordersScreen.dart';
import 'package:v1douvery/features/home/screens/home_screensModiles.dart';

import '../../features/home/responsive/responsive_layaout.dart';
import '../../provider/theme.dart';

class MainScreenAdmin extends StatelessWidget {
  static const String routeName = '/actual-home';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double bottomBarWidth = 43;
    double bottomBarBorderWidth = 2;
    List<Widget> data = [
      AdminScreen(),
      OrdersScreen(),
      AnalyticsScreen(),
      AccountsBrands(),
    ];
    final currentTheme = Provider.of<ThemeProvider>(context);
    return CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  child: Icon(Iconsax.home4),
                ),
                activeIcon: GestureDetector(
                  onDoubleTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => MainScreenAdmin(),
                    ),
                  ),
                  child: Container(
                    width: bottomBarWidth,
                    margin: EdgeInsets.only(),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xff19323C),
                          width: bottomBarBorderWidth,
                        ),
                      ),
                    ),
                    height: 40,
                    child: Icon(
                      Iconsax.home4,
                      size: 30,
                    ),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.activity,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.shapes,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.shop,
                ),
              ),
            ],
            border: Border(
              top: BorderSide(
                color: currentTheme.isDarkTheme()
                    ? Color.fromARGB(3, 252, 252, 252)
                    : Color.fromARGB(26, 5, 12, 43),
              ),
            ),
            backgroundColor: currentTheme.isDarkTheme()
                ? GlobalVariables.navBardarkbackgroundColor
                : GlobalVariables.navBarbackgroundColor,
            activeColor: currentTheme.isDarkTheme()
                ? Color(0XFFFCFCFC)
                : GlobalVariables.appBarbackgroundColor,
            inactiveColor: currentTheme.isDarkTheme()
                ? Color.fromARGB(228, 144, 144, 144)
                : GlobalVariables.unselectedNavBarColor,
            iconSize: 27,
          ),
          tabBuilder: (context, index) {
            return Container(
              child: CupertinoTabView(
                builder: (context) {
                  return data[index];
                },
              ),
            );
          },
        ));
  }
}
