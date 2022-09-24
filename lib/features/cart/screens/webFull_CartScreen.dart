import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/mobiles/appBarIcons.dart';
import 'package:v1douvery/NAV/mobiles/bottomNavSearchTitle.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/NAV/mobiles/topTitleButtom.dart';
import 'package:v1douvery/NAV/web/Web_appBarIcons.dart';
import 'package:v1douvery/NAV/web/Web_bottomNavSearchTitle.dart';

import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/Nosession.dart';
import 'package:v1douvery/features/account/widgets/categoriasUser.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/account/widgets/perfilUser.dart';
import 'package:v1douvery/features/account/widgets/WelcomeUser.dart';
import 'package:v1douvery/features/account/widgets/webFull/webFull_ordenesUser.dart';
import 'package:v1douvery/features/account/widgets/webFull/webFull_categoriasUser.dart';
import 'package:v1douvery/features/account/widgets/webFull/webFull_perfilUser.dart';
import 'package:v1douvery/features/address/screens/addresScreens.dart';
import 'package:v1douvery/features/auth/responsive/authResponsivelayout.dart';
import 'package:v1douvery/features/auth/screens/auth_screen.dart';
import 'package:v1douvery/features/cart/screens/cartScreen.dart';
import 'package:v1douvery/features/cart/widgets/cardProduct.dart';
import 'package:v1douvery/features/cart/widgets/cartSubTotal.dart';
import 'package:v1douvery/features/cart/widgets/web/WebFull_cardProduct.dart';
import 'package:v1douvery/features/cart/widgets/web/WebFull_cartSubTotal.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';
import 'package:v1douvery/provider/user_provider.dart';

class WebFull_CartScreen extends StatelessWidget {
  const WebFull_CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(75),
            child: Center(
              child: Web_AppBarIcons(),
            ),
          ),
          body: Provider.of<UserProvider>(context).user.token.isNotEmpty
              ? Session()
              : Nosession(),
        ));

    //SelectBody
  }
}

class Session extends StatelessWidget {
  const Session({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();

    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebFull_NavCategory(),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      color: GlobalVariables.backgroundColor,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              child: ElevatedButton.icon(
                                autofocus: false,
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffed174f), // background
                                  // foreground
                                ),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddressScreen(
                                      totalAmount: sum.toString(),
                                      cantid: user.cart.length.toString(),
                                    ),
                                  ),
                                ),
                                icon: Icon(Icons.payments, size: 36),
                                label: Text(
                                  "Proceder a pagar (${user.cart.length} items)",
                                ),
                              ),
                            ),
                          ),
                          WebFull_CartSubtotal(),
                          const SizedBox(height: 15),
                          Container(
                            color: Colors.black12.withOpacity(0.04),
                            height: 1,
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: GlobalVariables.backgroundColor,
                      ),
                      width: MediaQuery.of(context).size.width / 1.7,
                      height: 750,
                      child: ListView.builder(
                        itemCount: user.cart.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            child: WebFull_CartProduct(
                              index: index,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Nosession extends StatelessWidget {
  const Nosession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebFull_NavCategory(),
            NotSessions(),
            Container(
              child: IconButton(
                icon: GestureDetector(
                  child: Icon(
                    IconlyLight.login,
                    color: GlobalVariables.colorRosaRojVivo,
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebFullResponsiveLayaout(),
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
