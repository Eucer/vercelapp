import 'package:animate_do/animate_do.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/common/widgets/stars.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/address/screens/addresScreens.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/features/pruductDetails/services/pruductDetailsServices.dart';
import 'package:v1douvery/models/product.dart';
import 'package:v1douvery/models/ratings.dart';
import 'package:v1douvery/provider/user_provider.dart';

class Web_carNew extends StatefulWidget {
  const Web_carNew({Key? key}) : super(key: key);

  @override
  State<Web_carNew> createState() => _Web_carNew();
}

class _Web_carNew extends State<Web_carNew> {
  double scrollPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 0,
              top: 5,
              bottom: 10,
            ),
            child: ClipRRect(
              child: Container(
                height: 300,
                color: const Color(0xffC70039),
                width: 100,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Center(
                        child: Text(
                          'Articulos Nuevos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xffe9ebee),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          // Respond to button press
                        },
                        child: const Text(
                          'Ver mas',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xffe9ebee),
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliderCards(),
        ],
      ),
    );
  }
}

class SliderCards extends StatefulWidget {
  @override
  State<SliderCards> createState() => _SliderCardsState();
}

class _SliderCardsState extends State<SliderCards> {
  PageController _controller = PageController(
    viewportFraction: 0.4,
  );

  List<Product>? productList;

  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchNewProducts();
  }

  fetchNewProducts() async {
    productList = await homeServices.fetchNewProducts(
      context: context,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding:
            const EdgeInsets.only(left: 110.0, top: 5.0, right: 10, bottom: 0),
        child: CarouselProductToNamedCategory(
          productList: productList,
        ),
      );
}

class CarouselProductToNamedCategory extends StatefulWidget {
  CarouselProductToNamedCategory({
    Key? key,
    required this.productList,
  }) : super(key: key);
  final List<Product>? productList;

  @override
  State<CarouselProductToNamedCategory> createState() =>
      _CarouselProductToNamedCategoryState();
}

class _CarouselProductToNamedCategoryState
    extends State<CarouselProductToNamedCategory> {
  List<Rating>? rating;
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  @override
  Widget build(BuildContext context) {
    //edit modal
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return widget.productList == null
        ? const Loader()
        : Container(
            color: GlobalVariables.backgroundColor,
            child: SizedBox(
              height: 300,
              width: 900,
              child: ListView.builder(
                itemCount: widget.productList!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final product = widget.productList![index];

                  double totalRating = 0;
                  for (int i = 0; i < product.rating!.length; i++) {
                    totalRating += product.rating![i].rating;
                  }
                  double avgRating = 0;
                  if (totalRating != 0) {
                    avgRating = totalRating / product.rating!.length;
                  }

                  void addToCart() {
                    final product = widget.productList![index];
                    productDetailsServices.addToCart(
                      context: context,
                      product: product,
                    );
                  }

                  //* MOballlll ********************************
                  void _modalInteriorFerce(BuildContext context) {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext bc) {
                        final product = widget.productList![index];
                        return Container(
                          height: 700,
                          color: GlobalVariables.greyBackgroundCOlor,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0,
                                          right: 0,
                                          top: 0.0,
                                          bottom: 1.0),
                                      child: Container(
                                        height: 33,
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                                  Container(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        if (avgRating >= 5) ...[
                                                          Flash(
                                                              child: Stars(
                                                                  rating:
                                                                      avgRating)),
                                                        ] else ...[
                                                          Stars(
                                                              rating:
                                                                  avgRating),
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
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    'Precio: ',
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 15),
                                                  ),

                                                  Text(
                                                    '\$${product.price}',
                                                    style: TextStyle(
                                                      color: Color(0xff1C2833),
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                    ),
                                    Container(
                                      color: GlobalVariables.backgroundColor,
                                      child: CarouselSlider(
                                        options: CarouselOptions(
                                          height: 250,
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
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Container(
                                                  height: 40,
                                                  child: CachedNetworkImage(
                                                      height: 100,
                                                      fit: BoxFit.contain,
                                                      width: double.infinity,
                                                      imageUrl: i),
                                                ),
                                              );
                                            },
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3.0),
                                      child: Container(
                                        color: GlobalVariables.backgroundColor,
                                        child: Column(
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              height: 30,
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(
                                                left: 10,
                                                top: 10,
                                              ),
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
                                                    TextSpan(
                                                      text: product.marca,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff10375C),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.white,
                                              margin: const EdgeInsets.only(
                                                  top: 5, left: 10),
                                              width: double.infinity,
                                              height: 50,
                                              child: Text(
                                                product.name,
                                                style: TextStyle(
                                                  color: Color(0xff1C2833),
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.4,
                                                  fontSize: 15.0,
                                                ),
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 1.0,
                                                  bottom: 1.0,
                                                  left: 8,
                                                  right: 8),
                                              child: Container(
                                                height: 50,
                                                width: double.infinity,
                                                padding: EdgeInsets.all(0),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border(
                                                        top: BorderSide(
                                                            width: 1,
                                                            color: GlobalVariables
                                                                .colorTextGreylv10))),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: Row(
                                                          children: [
                                                            const SizedBox(
                                                                width: 10),
                                                            ElevatedButton.icon(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Color(
                                                                    0xff1a49ab), // background
                                                                // foreground
                                                              ),
                                                              onPressed: () {
                                                                addToCart();
                                                                ElegantNotification.success(
                                                                        showProgressIndicator:
                                                                            false,
                                                                        width: MediaQuery.of(context).size.width /
                                                                            1.1,
                                                                        title: Text(
                                                                            "Agregado"),
                                                                        description:
                                                                            Text(
                                                                                "Tu carrito se actualizo correctamente"))
                                                                    .show(
                                                                        context);
                                                              },
                                                              icon: Icon(
                                                                  IconlyLight
                                                                      .buy,
                                                                  size: 16),
                                                              label: Text(
                                                                  "Añadir al Carrito"),
                                                            ),
                                                            SizedBox(width: 10),
                                                            ElevatedButton.icon(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Color(
                                                                    0xff3A4750), // background
                                                                // foreground
                                                              ),
                                                              onPressed: () =>
                                                                  Navigator
                                                                      .push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ProductDetailsScreen(
                                                                    product:
                                                                        product,
                                                                  ),
                                                                ),
                                                              ),
                                                              icon: Icon(
                                                                  Icons
                                                                      .preview_outlined,
                                                                  size: 16),
                                                              label: Text(
                                                                  "Ver details"),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return Container(
                      height: 105,
                      width: 1000,
                      child: CarouselSlider.builder(
                        itemCount: widget.productList!.length,
                        itemBuilder: (context, index, realIndex) {
                          final product = widget.productList![index];
                          return Container(
                            width: 300,
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                    product: product,
                                  ),
                                ),
                              ),
                              child: Container(
                                width: 300,
                                height: 80.0,
                                child: product == null
                                    ? const Loader()
                                    : GestureDetector(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailsScreen(
                                              product: product,
                                            ),
                                          ),
                                        ),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            border: Border(
                                                left: BorderSide(
                                              color: GlobalVariables
                                                  .colorTextGreylv10,
                                              width: 1,
                                            )),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            children: [
                                              Center(
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 2.0),
                                                  width: 150.0,
                                                  height: 30,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 5,
                                                            bottom: 5),
                                                    child: Center(
                                                      child: Text(
                                                        product.name,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff1C2833),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          letterSpacing: 0.4,
                                                          fontSize: 11.0,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 300.0,
                                                height: 150.0,
                                                child: widget.productList ==
                                                        null
                                                    ? const Loader()
                                                    : SingleProduct(
                                                        imagen:
                                                            product.images[0],
                                                      ),
                                              ),
                                              Container(
                                                height: 40,
                                                width: 120.0,
                                                color: Color(0xffFffffff),
                                                child: CustomnIconsButton(
                                                  onPressed: () {
                                                    _modalInteriorFerce(
                                                        context);
                                                  },
                                                  icon: Icon(
                                                      Icons.keyboard_control),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                          viewportFraction: 0.3,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          aspectRatio: 1 / 2,
                          disableCenter: true,
                          pageSnapping: false,
                          padEnds: false,
                          pauseAutoPlayOnTouch: false,
                        ),
                      ));
                },
              ),
            ),
          );
  }
}
