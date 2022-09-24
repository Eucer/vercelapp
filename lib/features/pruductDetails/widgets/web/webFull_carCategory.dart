import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/common/widgets/header_double.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/features/pruductDetails/screens/webFull_productDetails.dart';
import 'package:v1douvery/models/product.dart';

import '../../../category/services/categoryServices.dart';

class WebFull_carCategory extends StatefulWidget {
  final String categoryProduct;
  const WebFull_carCategory({Key? key, required this.categoryProduct})
      : super(key: key);

  @override
  State<WebFull_carCategory> createState() => _WebFull_carCategoryState();
}

class _WebFull_carCategoryState extends State<WebFull_carCategory> {
  List<Product>? productList;
  final CategoryServices categoryServices = CategoryServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await categoryServices.fetchCategoryProducts(
      context: context,
      category: widget.categoryProduct,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final CarouselController _controller = CarouselController();

    @override
    void initState() {
      super.initState();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        width: 860,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color.fromARGB(7, 0, 0, 0),
                  ),
                ),
              ),
              child: headerDoubleText(
                textHeader: r'Productos de ' + widget.categoryProduct,
                textAction: 'Ver mas',
              ),
            ),
            productList == null
                ? const Loader()
                : Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    width: 1260,
                    color: GlobalVariables.backgroundColor,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                              height: 210,
                              width: 1260,
                              child: CarouselSlider.builder(
                                itemCount: productList!.length,
                                itemBuilder: (context, index, realIndex) {
                                  final product = productList![index];
                                  return GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            WebFull_productDetails(
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
                                              color: Color.fromARGB(
                                                  176, 255, 3, 100),
                                            )),
                                          ),
                                          Container(
                                            width: 155.0,
                                            height: 110.0,
                                            child: productList == null
                                                ? const Loader()
                                                : CachedNetworkImage(
                                                    imageUrl:
                                                        product.images[0]),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Column(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  margin: const EdgeInsets.only(
                                                      top: 2.0, left: 10),
                                                  child: Text(
                                                    product.name,
                                                    style: const TextStyle(
                                                      color: Color(0xff1C2833),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      letterSpacing: 0.4,
                                                      fontSize: 11.0,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0.0),
                                                  child: Container(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 2.0, left: 10),
                                                    child: Text(
                                                      'Envio ' + 'Gratis',
                                                      style: GoogleFonts.roboto(
                                                        color: Color.fromARGB(
                                                            255, 4, 161, 17),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: 1,
                                                        fontSize: 10.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 60.0,
                                                          bottom: 0.0),
                                                  child: Text(
                                                    r'$' +
                                                        product.price
                                                            .toString(),
                                                    style: GoogleFonts.roboto(
                                                      color: Color(0xff1C2833),
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                options: CarouselOptions(
                                  enableInfiniteScroll: false,
                                  viewportFraction: 0.2,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.height,
                                  aspectRatio: 1 / 2,
                                  disableCenter: true,
                                  pageSnapping: false,
                                  padEnds: false,
                                  pauseAutoPlayOnTouch: false,
                                ),
                                carouselController: _controller,
                              )),
                        ),
                        Center(
                          child: Positioned(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: ElevatedButton(
                                    onPressed: () => _controller.previousPage(),
                                    child: Text('←'),
                                  ),
                                ),
                                Flexible(
                                  child: ElevatedButton(
                                    onPressed: () => _controller.nextPage(),
                                    child: Text('→'),
                                  ),
                                ),
                              ],
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
  }
}
