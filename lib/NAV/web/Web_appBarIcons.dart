import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/NAV/web/Web_centerSearchNav.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/common/widgets/iconCart.dart';
import 'package:v1douvery/constantes/global_variables.dart';

class Web_AppBarIcons extends StatelessWidget {
  const Web_AppBarIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 0.0, right: 0),
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 100,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(15),
        child: Web_CenterSearchNav(),
      ),
      backgroundColor: GlobalVariables.appBarbackgroundColor,
    );
  }
}
