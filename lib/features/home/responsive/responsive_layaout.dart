import 'package:flutter/material.dart';
import 'package:v1douvery/common/widgets/bottom_bar.dart';
import 'package:v1douvery/features/home/responsive/dimesions.dart';
import 'package:v1douvery/features/home/screens/home_screensModiles.dart';
import 'package:v1douvery/features/home/screens/home_screensWeb.dart';
import 'package:v1douvery/features/home/screens/home_screensWebFull.dart';

class ResponsiveMobiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return MainScreen();
        } else {
          return HomeScreenWeb();
        }
      },
    );
  }
}

class ResponsiveLayaout extends StatelessWidget {
  static const String routeName = '/responsive';
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < webWidth) {
          return ResponsiveMobiles();
        } else {
          return MainScreenHomeScreenWebFull();
        }
      },
    );
  }
}
