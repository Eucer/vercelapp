import 'package:flutter/material.dart';
import 'package:v1douvery/common/widgets/bottom_bar.dart';
import 'package:v1douvery/common/widgets/bottom_barAdmin.dart';
import 'package:v1douvery/features/admin/screens/Full/navigationRail/webFull_navRail.dart';
import 'package:v1douvery/features/admin/screens/Full/screens/adminScreens.dart';
import 'package:v1douvery/features/admin/screens/adminScreens.dart';
import 'package:v1douvery/features/home/responsive/dimesions.dart';
import 'package:v1douvery/features/home/screens/home_screensModiles.dart';
import 'package:v1douvery/features/home/screens/home_screensWeb.dart';
import 'package:v1douvery/features/home/screens/home_screensWebFull.dart';

class AdminResponsiveLayaout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < webWidth) {
          return MainScreenAdmin();
        } else {
          return WebFullAdminNavRail();
        }
      },
    );
  }
}
