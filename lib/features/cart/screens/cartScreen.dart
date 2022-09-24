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
import 'package:v1douvery/common/widgets/custon_button.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/address/screens/addresScreens.dart';
import 'package:v1douvery/features/cart/widgets/cardProduct.dart';
import 'package:v1douvery/features/cart/widgets/cartSubTotal.dart';

import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../../../provider/theme.dart';
import '../../Drawer/screen/mobiles_drawerScreen.dart';
import '../../noSessions/screens/NoSessionsUser.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: currentTheme.isDarkTheme()
          ? GlobalVariables.darkbackgroundColor
          : GlobalVariables.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(105),
        child: Center(
          child: AppBarIcons(),
        ),
      ),
      drawer: DrawerScreen(),
      //SelectBody
      body: user.cart.length != 0 ? SessionsCart() : NoSessionsUser(),
    );
  }
}

class SessionsCart extends StatefulWidget {
  SessionsCart({Key? key}) : super(key: key);

  @override
  State<SessionsCart> createState() => _SessionsCartState();
}

class _SessionsCartState extends State<SessionsCart> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    final currentTheme = Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
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
          CartSubtotal(),
          const SizedBox(height: 15),
          Container(
            color: currentTheme.isDarkTheme()
                ? Colors.white70.withOpacity(0.08)
                : Colors.black12.withOpacity(0.08),
            height: 1,
          ),
          Container(
            color: currentTheme.isDarkTheme()
                ? GlobalVariables.darkOFbackgroundColor
                : GlobalVariables.greyBackgroundCOlor,
            height: 550,
            child: ListView.builder(
              itemCount: user.cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  child: CartProduct(
                    index: index,
                  ),
                );
              },
            ),
          ),
          Container(
            color: currentTheme.isDarkTheme()
                ? Colors.white70.withOpacity(0.08)
                : Colors.black12.withOpacity(0.08),
            height: 1,
          ),
        ],
      ),
    );
  }
}
