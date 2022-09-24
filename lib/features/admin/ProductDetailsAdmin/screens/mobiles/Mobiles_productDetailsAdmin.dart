import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/features/admin/ProductDetailsAdmin/widgets/imgProduct.dart';
import 'package:v1douvery/features/admin/screens/adminScreens.dart';
import 'package:v1douvery/models/product.dart';
import 'package:v1douvery/provider/theme.dart';

import '../../../../../constantes/global_variables.dart';
import '../../../../Drawer/screen/mobiles_drawerScreen.dart';
import '../../../../pruductDetails/screens/mobiles_productDetailsScrenn.dart';

class MobilesProductDetailsAdmin extends StatefulWidget {
  final Product product;
  MobilesProductDetailsAdmin({Key? key, required this.product})
      : super(key: key);

  @override
  State<MobilesProductDetailsAdmin> createState() =>
      _MobilesProductDetailsAdminState();
}

class _MobilesProductDetailsAdminState
    extends State<MobilesProductDetailsAdmin> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: currentTheme.isDarkTheme()
          ? GlobalVariables.darkOFbackgroundColor
          : GlobalVariables.greyBackgroundCOlor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Color(
                0XFF0D3B66,
              ),
              flexibleSpace: Container(),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomnIconsButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          'Product Details',
                          style: GoogleFonts.lato(
                            color: Color(0xffFCFCFC),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ContainerNavOpci(),
          ],
        ),
      ),
      drawer: DrawerScreen(),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xfff1f5f9)),
                  ),
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.darkbackgroundColor
                      : GlobalVariables.backgroundColor,
                ),
                padding: const EdgeInsets.all(8.0),
                height: 1500,
                child: ContainedTabBarView(
                  tabs: [
                    Text(
                      'Vendedor View',
                      style: TextStyle(
                        color: currentTheme.isDarkTheme()
                            ? GlobalVariables.text1darkbackgroundColor
                            : Color.fromARGB(206, 0, 0, 0),
                      ),
                    ),
                    Text(
                      'Cliente View',
                      style: TextStyle(
                        color: currentTheme.isDarkTheme()
                            ? GlobalVariables.text1darkbackgroundColor
                            : Color.fromARGB(206, 0, 0, 0),
                      ),
                    ),
                  ],
                  views: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: VendedorProductDetails(
                        product: widget.product,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ProductDetailsScreen(
                        product: widget.product,
                      ),
                    ),
                  ],
                  // ignore: avoid_print
                  onChange: (index) => print(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
