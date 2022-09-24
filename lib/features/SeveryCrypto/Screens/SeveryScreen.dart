import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/SeveryCrypto/widgets/present.dart';
import 'package:v1douvery/provider/user_provider.dart';

class SeveryScrenn extends StatefulWidget {
  SeveryScrenn({Key? key}) : super(key: key);

  @override
  State<SeveryScrenn> createState() => _SeveryScrennState();
}

class _SeveryScrennState extends State<SeveryScrenn> {
  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(105),
        child: Center(
          child: AppBar(
            elevation: 0,
            title: Row(
              children: [
                Text(
                  'Douvery ',
                  style: GoogleFonts.lato(
                      color: Color(0xffFCFCFC), fontWeight: FontWeight.bold),
                ),
                Icon(Icons.wifi_2_bar_sharp),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(IconlyLight.addUser),
                onPressed: () {},
              ),
              Badge(
                toAnimate: false,
                position: BadgePosition.topEnd(top: 2, end: 3),
                animationDuration: Duration(milliseconds: 300),
                badgeColor: Color(0xffe84118),
                badgeContent: Text(
                  userCartLen.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
                child: IconButton(
                  icon: const Icon(IconlyLight.buy),
                  onPressed: () {},
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(15),
              child: CenterSearchNav(),
            ),
            backgroundColor: GlobalVariables.appBarbackgroundColor,
          ),
        ),
      ),

      //SelectBody
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              PrensetCrypto(),
            ],
          ),
        ),
      ),
    );
  }
}
