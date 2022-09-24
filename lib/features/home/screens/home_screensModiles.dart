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
import 'package:v1douvery/common/widgets/bottom_bar.dart';
import 'package:v1douvery/common/widgets/custon_button.dart';
import 'package:v1douvery/common/widgets/iconCart.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/home/widgets/mobiles/carAll.dart';
import 'package:v1douvery/features/home/widgets/mobiles/carAnimations.dart';
import 'package:v1douvery/features/home/widgets/mobiles/carBrands.dart';
import 'package:v1douvery/features/home/widgets/mobiles/carCrypyoPromo.dart';
import 'package:v1douvery/features/home/widgets/mobiles/carKits.dart';

import 'package:v1douvery/features/home/widgets/mobiles/listMarcaSelect.dart';

import 'package:v1douvery/features/home/widgets/mobiles/banner_widget.dart';
import 'package:v1douvery/features/home/widgets/mobiles/deal-of-day.dart';
import 'package:v1douvery/features/home/widgets/mobiles/listDealOfDay.dart';
import 'package:v1douvery/features/home/widgets/mobiles/listNew.dart';

import 'package:v1douvery/features/home/widgets/mobiles/listRandom.dart';
import 'package:v1douvery/features/home/widgets/mobiles/listRecomend.dart';
import 'package:v1douvery/features/home/widgets/mobiles/testing.dart';
import 'package:v1douvery/models/product.dart';

import 'package:v1douvery/provider/user_provider.dart';

import '../../../models/themePreference.dart';
import '../../../provider/theme.dart';
import '../../Drawer/screen/mobiles_drawerScreen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    void _reset() {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => HomeScreen(),
        ),
      );
    }

    return Scaffold(
        backgroundColor: currentTheme.isDarkTheme()
            ? GlobalVariables.darkOFbackgroundColor
            : GlobalVariables.greyBackgroundCOlor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(105),
          child: Center(
            child: AppBarIcons(),
          ),
        ),
        drawer: DrawerScreen(),
        //SelectBody
        body: SwipeRefresh.material(
            stateStream: _stream,
            onRefresh: _reset,
            children: [
              Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      NavCategory(),
                      BannerWidget(),
                      CardsOneWidget(),
                      ListDealOfDay(),
                      DealOfDay(),
                      ListRandom(),
                      RecomendProduct(),
                      ListMarca(),
                      CartCrypto(),
                      CarAnimationsTesting(),
                      CardBrands(),
                      DealOfDay(),
                      DealOfDay(),
                      DealOfDay(),
                    ],
                  ),
                ),
              )
            ]));
  }
}
