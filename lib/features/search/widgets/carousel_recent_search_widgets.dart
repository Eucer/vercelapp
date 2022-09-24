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

import '../../../provider/theme.dart';

class CarouselRecentSearch extends StatefulWidget {
  const CarouselRecentSearch({Key? key}) : super(key: key);

  @override
  State<CarouselRecentSearch> createState() => _CarouselRecentSearchState();
}

class _CarouselRecentSearchState extends State<CarouselRecentSearch> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchTest();
  }

  fetchTest() async {
    productList = await homeServices.fetchTest(
      context: context,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Container(
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
                    'Popular',
                    style: TextStyle(
                        fontSize: 13,
                        color: currentTheme.isDarkTheme()
                            ? GlobalVariables.text1darkbackgroundColor
                            : GlobalVariables.text1WhithegroundColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        productList == null
            ? const Loader()
            : Container(
                padding: EdgeInsets.only(top: 10),
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.darkbackgroundColor
                    : GlobalVariables.backgroundColor,
                child: SizedBox(
                  height: 135,
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
                          width: 135,
                          child: Column(
                            children: [
                              Container(
                                width: 135.0,
                                height: 110.0,
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
                                                padding: const EdgeInsets.only(
                                                    left: 0.0, top: 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  child: CachedNetworkImage(
                                                    imageUrl: product.images[0],
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
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
      ],
    );
  }
}
