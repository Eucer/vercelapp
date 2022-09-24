import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:badges/badges.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/common/widgets/iconCart.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/provider/user_provider.dart';

class TopTitleButtom extends StatelessWidget {
  final String title;
  const TopTitleButtom({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    return Center(
      child: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Text(
              title,
            ),
          ],
        ),
        actions: [
          IconCart(),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(15),
          child: CenterSearchNav(),
        ),
        backgroundColor: GlobalVariables.appBarbackgroundColor,
      ),
    );
  }
}
