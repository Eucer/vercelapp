import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/header_double.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/models/product.dart';

import '../../../../provider/theme.dart';

class ListRandom extends StatefulWidget {
  const ListRandom({Key? key}) : super(key: key);

  @override
  State<ListRandom> createState() => _ListRandomState();
}

class _ListRandomState extends State<ListRandom> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchListradomn();
  }

  fetchListradomn() async {
    productList = await homeServices.fetchListradomn(
      context: context,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 3.0),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              color: currentTheme.isDarkTheme()
                  ? GlobalVariables.darkbackgroundColor
                  : GlobalVariables.backgroundColor,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              decoration: BoxDecoration(
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.darkbackgroundColor
                    : GlobalVariables.backgroundColor,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: currentTheme.isDarkTheme()
                        ? GlobalVariables.borderColorsDarklv10
                        : GlobalVariables.borderColorsWhithelv10,
                  ),
                ),
              ),
              child: Container(
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Menos de 100',
                      style: TextStyle(
                        fontSize: 15,
                        color: currentTheme.isDarkTheme()
                            ? GlobalVariables.text1darkbackgroundColor
                            : GlobalVariables.text1WhithegroundColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          productList == null
              ? const Loader()
              : Container(
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.darkbackgroundColor
                      : GlobalVariables.backgroundColor,
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: productList!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final product = productList![index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                product: product,
                              ),
                            ),
                          ),
                          child: Container(
                            width: 150,
                            child: Column(
                              children: [
                                Align(
                                  child: Container(
                                      child: Icon(
                                    Icons.price_change,
                                    color: Color.fromARGB(176, 255, 3, 100),
                                  )),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  width: 135.0,
                                  height: 120.0,
                                  child: productList == null
                                      ? const Loader()
                                      : Column(
                                          children: [
                                            Container(
                                              color: currentTheme.isDarkTheme()
                                                  ? GlobalVariables
                                                      .darkbackgroundColor
                                                  : GlobalVariables
                                                      .backgroundColor,
                                              child: GestureDetector(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0.0, top: 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          product.images[0],
                                                      width: 150,
                                                      height: 110.0,
                                                      fit: BoxFit.scaleDown,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 0.0),
                                          child: Text(
                                            product.name,
                                            style: TextStyle(
                                              color: currentTheme.isDarkTheme()
                                                  ? GlobalVariables
                                                      .text1darkbackgroundColor
                                                  : GlobalVariables
                                                      .text1WhithegroundColor,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.4,
                                              fontSize: 11.0,
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 60.0, top: 5.0),
                                        child: Text(
                                          r'$' + product.price.toString(),
                                          style: GoogleFonts.roboto(
                                            color: currentTheme.isDarkTheme()
                                                ? GlobalVariables
                                                    .text1darkbackgroundColor
                                                : GlobalVariables
                                                    .text1WhithegroundColor,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.4,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
