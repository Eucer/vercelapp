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
import 'package:v1douvery/provider/theme.dart';

class ListMarca extends StatefulWidget {
  const ListMarca({Key? key}) : super(key: key);

  @override
  State<ListMarca> createState() => _ListMarcaState();
}

class _ListMarcaState extends State<ListMarca> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchMarcaProducts();
  }

  fetchMarcaProducts() async {
    productList = await homeServices.fetchMarcaProducts(
      context: context,
      marca: 'Apple',
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 8.0),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.darkbackgroundColor
                    : GlobalVariables.backgroundColor,
              ),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
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
                          'Apple',
                          style: TextStyle(
                            fontSize: 15,
                            color: currentTheme.isDarkTheme()
                                ? GlobalVariables.text1darkbackgroundColor
                                : GlobalVariables.text1WhithegroundColor,
                          ),
                        ),
                      ],
                    ),
                  ))),
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
                            decoration: BoxDecoration(
                              color: currentTheme.isDarkTheme()
                                  ? GlobalVariables.darkbackgroundColor
                                  : GlobalVariables.backgroundColor,
                            ),
                            child: Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      color: currentTheme.isDarkTheme()
                                          ? GlobalVariables.darkbackgroundColor
                                          : GlobalVariables.backgroundColor,
                                    ),
                                    width: 200,
                                    height: 120,
                                    child: productList == null
                                        ? const Loader()
                                        : Container(
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
                                          )),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 2),
                                        alignment: Alignment.centerLeft,
                                        width: double.infinity,
                                        color: currentTheme.isDarkTheme()
                                            ? GlobalVariables
                                                .darkbackgroundColor
                                            : GlobalVariables.backgroundColor,
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
                                            fontSize: 12.0,
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 2),
                                        width: double.infinity,
                                        color: currentTheme.isDarkTheme()
                                            ? GlobalVariables
                                                .darkbackgroundColor
                                            : GlobalVariables.backgroundColor,
                                        child: Text(
                                          product.marca,
                                          style: TextStyle(
                                            color: currentTheme.isDarkTheme()
                                                ? GlobalVariables
                                                    .text1darkbackgroundColor
                                                : GlobalVariables
                                                    .text1WhithegroundColor,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.4,
                                            fontSize: 11.0,
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '\$${product.price}',
                                          style: TextStyle(
                                            color: currentTheme.isDarkTheme()
                                                ? Color.fromARGB(
                                                    255, 4, 78, 206)
                                                : GlobalVariables
                                                    .colorPriceSecond,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5,
                                            fontSize: 14.0,
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
                )
        ],
      ),
    );
  }
}
