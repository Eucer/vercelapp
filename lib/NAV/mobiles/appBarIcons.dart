import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/common/widgets/iconCart.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/models/themePreference.dart';
import 'package:v1douvery/provider/theme.dart';

import '../../features/Drawer/screen/mobiles_drawerScreen.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 25.0, right: 40),
        child: Container(
          alignment: Alignment.center,
          width: 150,
          height: 100,
          child: CachedNetworkImage(
            imageUrl:
                'https://res.cloudinary.com/douvery/image/upload/v1661701638/LOGO/iizi2nvlhon5wwzdph3i.png',
          ),
        ),
      ),
      actions: [
        Builder(
          builder: (context) {
            return CustomnIconsButton(
              icon: Icon(Iconsax.user_octagon,
                  size: 28, color: Color.fromARGB(235, 255, 255, 255)),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        IconCart()
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(15),
        child: CenterSearchNav(),
      ),
      backgroundColor: GlobalVariables.appBarbackgroundColor,
    );
  }
}
