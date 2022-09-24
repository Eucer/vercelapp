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
import 'package:v1douvery/features/home/widgets/mobiles/listNew.dart';
import 'package:v1douvery/features/home/widgets/mobiles/banner_widget.dart';
import 'package:v1douvery/features/home/widgets/mobiles/deal-of-day.dart';
import 'package:v1douvery/features/home/widgets/mobiles/listDealOfDay.dart';

import 'package:v1douvery/features/home/widgets/mobiles/listRandom.dart';
import 'package:v1douvery/features/home/widgets/mobiles/listRecomend.dart';
import 'package:v1douvery/features/home/widgets/mobiles/testing.dart';
import 'package:v1douvery/features/home/widgets/web/web_banner.dart';
import 'package:v1douvery/features/home/widgets/web/web_carNew.dart';
import 'package:v1douvery/features/home/widgets/web/web_carRand.dart';
import 'package:v1douvery/features/home/widgets/web/web_conCate.dart';
import 'package:v1douvery/features/home/widgets/web/web_vertUser.dart';
import 'package:v1douvery/features/home/widgets/webFull/web_conCate.dart';

import 'package:v1douvery/models/product.dart';

import 'package:v1douvery/provider/user_provider.dart';

class HomeScreenWeb extends StatefulWidget {
  static const String routeName = '/home';
  HomeScreenWeb({Key? key}) : super(key: key);

  @override
  State<HomeScreenWeb> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {
  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;
  @override
  Widget build(BuildContext context) {
    void _reset() {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => HomeScreenWeb(),
        ),
      );
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 173, 18, 18),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Web_NavCategory(),
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  height: 600,
                  child: Stack(
                    children: [
                      Web_BannerWidget(),
                      Positioned(
                        width: MediaQuery.of(context).size.width / 1,
                        top: 200,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Positioned(
                                    child: Web_CarRandom(),
                                  ),
                                  Positioned(
                                    child: Web_carNew(),
                                  ),
                                ],
                              ),
                              Web_vertUser()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
