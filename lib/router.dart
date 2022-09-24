import 'package:flutter/material.dart';
import 'package:v1douvery/common/widgets/bottom_bar.dart';
import 'package:v1douvery/features/address/screens/addresScreens.dart';
import 'package:v1douvery/features/admin/widgests/addProductScreen.dart';
import 'package:v1douvery/features/admin/widgests/addProductScreen.dart';
import 'package:v1douvery/features/auth/screens/auth_screen.dart';

import 'package:v1douvery/features/home/screens/home_screensModiles.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeScreen(),
      );
    case MainScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MainScreen(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddProductScreen(),
      );
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
          cantid: '',
        ),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Scaffold(
          body: Center(
            child: Text('Pantalla no existe!'),
          ),
        ),
      );
  }
}
