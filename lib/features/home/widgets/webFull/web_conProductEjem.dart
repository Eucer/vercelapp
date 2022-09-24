import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:v1douvery/common/widgets/header_double.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/common/widgets/stars.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/brands/screens/brandsScreen.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/features/pruductDetails/screens/webFull_productDetails.dart';
import 'package:v1douvery/features/pruductDetails/services/pruductDetailsServices.dart';
import 'package:v1douvery/models/product.dart';

class WebFull_conName extends StatelessWidget {
  const WebFull_conName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5),
      child: Container(
        padding: const EdgeInsets.only(left: 20.0),
        color: Colors.white,
        width: 1260,
        height: 360,
        child: Row(
          children: [
            Web_brands1(name: 'AirPods Pro'),
            Web_brands1(
              name: '165Hz LED Curved FHD FreeSync Gaming Monitor - Black/Red',
            ),
            Web_brands1(
                name:
                    'Silla con estilo de carreras para videojuegos, reclinable, de piel, ergonómica, con reposapiés, color blanco (RSP-110-WHT), RESPAWN 110'),
          ],
        ),
      ),
    );
  }
}

class Web_brands1 extends StatefulWidget {
  final String name;
  const Web_brands1({Key? key, required this.name}) : super(key: key);

  @override
  State<Web_brands1> createState() => _Web_brands1State();
}

class _Web_brands1State extends State<Web_brands1> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchNameLimitProducts();
  }

  fetchNameLimitProducts() async {
    productList = await homeServices.fetchNameLimitProducts(
      context: context,
      name: widget.name,
    );
    setState(() {});
  }

  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  @override
  Widget build(BuildContext context) {
    return productList == null
        ? const Loader()
        : Container(
            margin: EdgeInsets.only(right: 10),
            color: Colors.white,
            width: 400,
            height: 380,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromARGB(12, 0, 0, 0),
                      ),
                    ),
                  ),
                  child: headerDoubleText(
                    textHeader: 'Productos Recomendados',
                    textAction: 'Ver mas',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  color: Color(0XFFF8F9F9),
                  child: Container(
                    width: 400,
                    height: 302,
                    child: ListView.builder(
                      itemCount: productList!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final product = productList![index];

                        double totalRating = 0;
                        for (int i = 0; i < product.rating!.length; i++) {
                          totalRating += product.rating![i].rating;
                        }
                        double avgRating = 0;
                        if (totalRating != 0) {
                          avgRating = totalRating / product.rating!.length;
                        }

                        void addToCart() {
                          final product = productList![index];
                          productDetailsServices.addToCart(
                            context: context,
                            product: product,
                          );
                        }

                        return Container(
                          child: Column(
                            children: [
                              Container(
                                height: 33,
                                width: 400,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1,
                                            color: GlobalVariables
                                                .colorTextGreylv10))),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () => Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (_, __, ___) =>
                                                    BrandsScreen(
                                                  brands: product.marca,
                                                ),
                                                settings: RouteSettings(
                                                  arguments: product.marca,
                                                ),
                                              ),
                                            ),
                                            child: Container(
                                              color: Colors.white,
                                              width: 40,
                                              height: 33,
                                              alignment: Alignment.centerLeft,
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    WidgetSpan(
                                                      child: Icon(
                                                        Icons.house_outlined,
                                                        size: 16,
                                                        color:
                                                            Color(0xff10375C),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (avgRating >= 5) ...[
                                                  Flash(
                                                      child: Stars(
                                                          rating: avgRating)),
                                                ] else ...[
                                                  Stars(rating: avgRating),
                                                ],
                                              ],
                                            ),
                                          ),

                                          Container(
                                            width: 50,
                                            child: Text(
                                              '(' +
                                                  avgRating.toString() +
                                                  ') ' +
                                                  product.rating!.length
                                                      .toString(),
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),

                                          Text(
                                            'Precio: ',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                          ),

                                          Text(
                                            r'$' + product.price.toString(),
                                            style: TextStyle(
                                              color: Color(0xff1C2833),
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.4,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          //
                                          Text(
                                            'Envio: ',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                          ),

                                          Text(
                                            'Gratis',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 4, 161, 17),
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ]),
                              ),
                              Container(
                                color: GlobalVariables.backgroundColor,
                                width: 400,
                                height: 200,
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: 200,
                                    viewportFraction: 1,
                                    aspectRatio: 16 / 9,
                                    initialPage: 0,
                                    enableInfiniteScroll: false,
                                    reverse: false,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                  items: product.images.map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: GestureDetector(
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
                                              color: Colors.white,
                                              width: 400,
                                              height: 500,
                                              child: CachedNetworkImage(
                                                  imageUrl: i),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                color: Colors.white,
                                width: 400,
                                height: 18,
                                child: Text(
                                  product.name,
                                  style: TextStyle(
                                    color: Color(0xff1C2833),
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.4,
                                    fontSize: 12.0,
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 400,
                                color: Colors.white,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 10),
                                            ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                primary: Color(
                                                    0xff1a49ab), // background
                                                // foreground
                                              ),
                                              onPressed: () {
                                                addToCart();
                                                ElegantNotification.success(
                                                        title: Text("Yes!"),
                                                        description: Text(
                                                            'Aggregado correctamente'))
                                                    .show(context);
                                              },
                                              icon: Icon(
                                                IconlyLight.buy,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                              label: Text(
                                                "Añadir al Carrito",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                primary: Color(
                                                    0xff3A4750), // background
                                                // foreground
                                              ),
                                              onPressed: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetailsScreen(
                                                    product: product,
                                                  ),
                                                ),
                                              ),
                                              icon: Icon(Icons.preview_outlined,
                                                  color: Colors.white,
                                                  size: 16),
                                              label: Text(
                                                "Ver details",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
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
