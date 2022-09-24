import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/header_bold.dart';
import 'package:v1douvery/common/widgets/header_double.dart';
import 'package:v1douvery/common/widgets/header_text.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/common/widgets/stars.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/cart/services/cardServices.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/features/pruductDetails/services/pruductDetailsServices.dart';
import 'package:v1douvery/main.dart';
import 'package:v1douvery/models/product.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../../../../provider/theme.dart';

class RecomendProduct extends StatefulWidget {
  const RecomendProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<RecomendProduct> createState() => _RecomendProductState();
}

class _RecomendProductState extends State<RecomendProduct> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryLimitProducts();
  }

  fetchCategoryLimitProducts() async {
    productList = await homeServices.fetchCategoryLimitProducts(
      context: context,
      category: 'Electronics',
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: currentTheme.isDarkTheme()
            ? GlobalVariables.darkbackgroundColor
            : GlobalVariables.backgroundColor,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 10, top: 15),
              child: Text(
                'Productos Recomendados',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.text1darkbackgroundColor
                      : GlobalVariables.text1WhithegroundColor,
                ),
              ),
            ),
            productList == null
                ? const Loader()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: currentTheme.isDarkTheme()
                          ? GlobalVariables.darkbackgroundColor
                          : GlobalVariables.backgroundColor,
                      height: 360,
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 8),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: productList!.length,
                          itemBuilder: ((context, index) {
                            final product = productList![index];
                            double totalRating = 0;
                            for (int i = 0; i < product.rating!.length; i++) {
                              totalRating += product.rating![i].rating;
                            }
                            double avgRating = 0;
                            if (totalRating != 0) {
                              avgRating = totalRating / product.rating!.length;
                            }
                            return product == null
                                ? const Loader()
                                : Center(
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailsScreen(
                                            product: product,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: currentTheme.isDarkTheme()
                                                ? GlobalVariables
                                                    .darkbackgroundColor
                                                : GlobalVariables
                                                    .backgroundColor,
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 1,
                                                color: currentTheme
                                                        .isDarkTheme()
                                                    ? GlobalVariables
                                                        .borderColorsDarklv10
                                                    : GlobalVariables
                                                        .borderColorsWhithelv10,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: CachedNetworkImage(
                                                    imageUrl: product.images[0],
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductDetailsScreen(
                                                      product: product,
                                                    ),
                                                  ),
                                                ),
                                                child: SizedBox(
                                                  child: Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () =>
                                                            Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                ProductDetailsScreen(
                                                              product: product,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              2,
                                                          child: Text(
                                                            product.name,
                                                            style: TextStyle(
                                                              color: currentTheme.isDarkTheme()
                                                                  ? GlobalVariables
                                                                      .text1darkbackgroundColor
                                                                  : GlobalVariables
                                                                      .text1WhithegroundColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              letterSpacing:
                                                                  0.4,
                                                              fontSize: 13.0,
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: SizedBox(
                                                              width: 200,
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Stars(
                                                                        rating:
                                                                            avgRating),
                                                                    GestureDetector(
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(50),
                                                                          color:
                                                                              Color(0xff36506C),
                                                                        ),
                                                                        alignment:
                                                                            Alignment.center,
                                                                        width:
                                                                            80.0,
                                                                        height:
                                                                            20.0,
                                                                        child:
                                                                            Text(
                                                                          'Recomend',
                                                                          style:
                                                                              TextStyle(
                                                                            color: currentTheme.isDarkTheme()
                                                                                ? GlobalVariables.text1darkbackgroundColor
                                                                                : GlobalVariables.text1darkbackgroundColor,
                                                                            fontSize:
                                                                                13,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ])))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                          })),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
