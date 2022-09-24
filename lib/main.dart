import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/cargin.dart';
import 'package:v1douvery/common/widgets/bottom_bar.dart';
import 'package:v1douvery/common/widgets/bottom_barAdmin.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/admin/responsive/Admin_responsive_layaout.dart';
import 'package:v1douvery/features/admin/screens/adminScreens.dart';
import 'package:v1douvery/features/auth/screens/auth_screen.dart';
import 'package:v1douvery/features/auth/services/auth_service.dart';
import 'package:v1douvery/features/home/responsive/responsive_layaout.dart';

import 'package:v1douvery/models/user.dart';
import 'package:v1douvery/provider/ordersProviders.dart';
import 'package:v1douvery/provider/theme.dart';
import 'package:v1douvery/provider/user_provider.dart';
import 'package:v1douvery/router.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => OrderProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
    getCurrentAppTheme();
  }

  ThemeProvider themeChangeProvider = new ThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setTheme =
        await themeChangeProvider.themePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: themeChangeProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Douvery',
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == 'user'
                ? ResponsiveLayaout()
                : AdminResponsiveLayaout()
            : ResponsiveLayaout(),
      ),
    );
  }
}
