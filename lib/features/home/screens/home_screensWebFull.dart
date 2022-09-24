import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swipe_refresh/swipe_refresh.dart';
import 'package:v1douvery/NAV/mobiles/appBarIcons.dart';
import 'package:v1douvery/NAV/mobiles/bottomNavSearchTitle.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/NAV/mobiles/topTitleButtom.dart';
import 'package:v1douvery/NAV/web/Web_appBarIcons.dart';
import 'package:v1douvery/NAV/web/Web_bottomNavSearchTitle.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/home/footer/screens/footerHome.dart';
import 'package:v1douvery/features/home/widgets/webFull/Web_carRating.dart';

import 'package:v1douvery/features/home/widgets/webFull/web_banner.dart';
import 'package:v1douvery/features/home/widgets/webFull/web_carMenosPrice.dart';
import 'package:v1douvery/features/home/widgets/webFull/web_carNew.dart';
import 'package:v1douvery/features/home/widgets/webFull/web_carPopular.dart';
import 'package:v1douvery/features/home/widgets/webFull/web_carRand.dart';
import 'package:v1douvery/features/home/widgets/webFull/web_conCate.dart';
import 'package:v1douvery/features/home/widgets/webFull/web_conProductEjem.dart';
import 'package:v1douvery/features/home/widgets/webFull/web_vertUser.dart';

import 'package:v1douvery/models/product.dart';

import 'package:v1douvery/provider/user_provider.dart';

import '../../../provider/theme.dart';
import '../widgets/webFull/web_conMarca.dart';

class MainScreenHomeScreenWebFull extends StatelessWidget {
  static const String routeName = '/actual-home';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      builder: (context, child) {
        return Scaffold(
          endDrawerEnableOpenDragGesture: false,
          body: child,
        );
      },
      debugShowCheckedModeBanner: false,
      home: HomeScreenWebFull(),
    );
  }
}

class HomeScreenWebFull extends StatefulWidget {
  static const String routeName = '/home';
  HomeScreenWebFull({Key? key}) : super(key: key);

  @override
  State<HomeScreenWebFull> createState() => _HomeScreenWebFullState();
}

class _HomeScreenWebFullState extends State<HomeScreenWebFull> {
  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    void _reset() {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => HomeScreenWebFull(),
        ),
      );
    }

    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
        backgroundColor: currentTheme.isDarkTheme()
            ? GlobalVariables.darkOFbackgroundColor
            : GlobalVariables.greyBackgroundCOlor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: Center(
            child: Web_AppBarIcons(),
          ),
        ),
        //SelectBody
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                WebFull_NavCategory(),
                Container(
                  height: 600,
                  child: Stack(
                    children: [
                      WebFull_BannerWidget(),
                      Positioned(
                        top: 200,
                        left: 110,
                        child: Container(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Positioned(
                                    child: WebFull_CarRandom(),
                                  ),
                                  Positioned(
                                    child: WebFull_carNew(),
                                  ),
                                ],
                              ),
                              Provider.of<UserProvider>(context)
                                      .user
                                      .token
                                      .isNotEmpty
                                  ? WebFull_Sessions_vertUser()
                                  : WebFull_NoSessions_vertUser(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                WebFull_carPopular(),
                WebFull_conCategory(),
                WebFull_carMenosPrice(),
                WebFull_conMarca(),
                WebFull_conName(),
                WebFull_carRating(),
                FooterHome()
              ],
            ),
          ),
        ));
  }
}
