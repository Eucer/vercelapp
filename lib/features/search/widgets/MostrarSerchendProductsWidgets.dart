import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/stars.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/models/product.dart';

import '../../../provider/theme.dart';

class SerchendWidgetsProducts extends StatelessWidget {
  final Product product;
  const SerchendWidgetsProducts({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    double avgRating = 0;
    if (totalRating != 0) {
      avgRating = totalRating / product.rating!.length;
    }
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                product: product,
              ),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.darkbackgroundColor
                    : GlobalVariables.backgroundColor,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: currentTheme.isDarkTheme()
                            ? GlobalVariables.borderColorsDarklv10
                            : Color.fromARGB(5, 0, 0, 0)))),
            margin: const EdgeInsets.symmetric(
              horizontal: 0,
            ),
            child: Row(
              children: [
                Container(
                  height: 105,
                  width: 135,
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.darkbackgroundColor
                      : GlobalVariables.backgroundColor,
                  child: CarouselSlider(
                    items: product.images.map(
                      (i) {
                        return Builder(
                          builder: (BuildContext context) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              imageUrl: i,
                              height: 105,
                              fit: BoxFit.contain,
                              width: 185,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: 105,
                      aspectRatio: 16 / 10,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        product.name,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: currentTheme.isDarkTheme()
                              ? GlobalVariables.text1darkbackgroundColor
                              : GlobalVariables.text1WhithegroundColor,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width / 1.6,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            product.marca,
                            style: GoogleFonts.roboto(
                              color: currentTheme.isDarkTheme()
                                  ? GlobalVariables.text20darkbackgroundColor
                                  : Color(0xff383838),
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.4,
                              fontSize: 11.0,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (avgRating >= 5) ...[
                              Flash(child: Stars(rating: avgRating)),
                            ] else ...[
                              Stars(rating: avgRating),
                            ],
                            Container(
                              width: MediaQuery.of(context).size.width / 2.7,
                              child: Text(
                                '( ' +
                                    avgRating.toStringAsPrecision(2) +
                                    ' ) ' +
                                    product.rating!.length
                                        .toStringAsPrecision(1),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 9,
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        'Envio ' + 'Gratis',
                        style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 4, 161, 17),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        '\$${product.price}',
                        style: GoogleFonts.roboto(
                          color: currentTheme.isDarkTheme()
                              ? GlobalVariables.text20darkbackgroundColor
                              : GlobalVariables.text1WhithegroundColor,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          fontSize: 15.0,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
