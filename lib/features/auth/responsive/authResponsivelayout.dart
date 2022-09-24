import 'package:flutter/material.dart';
import 'package:v1douvery/features/auth/screens/auth_screen.dart';
import 'package:v1douvery/features/auth/screens/webFull_authScren.dart';

import '../../home/responsive/dimesions.dart';

class WebFullResponsiveLayaout extends StatefulWidget {
  static const String routeName = '/responsive';

  @override
  State<WebFullResponsiveLayaout> createState() =>
      _WebFullResponsiveLayaoutState();
}

class _WebFullResponsiveLayaoutState extends State<WebFullResponsiveLayaout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < webWidth) {
          return AuthScreen();
        } else {
          return WebFullAuthScreen();
        }
      },
    );
  }
}
