import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/mobiles/bottomNavSearchTitle.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/NAV/mobiles/topTitleButtom.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/common/widgets/header_text.dart';
import 'package:v1douvery/common/widgets/iconCart.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/common/widgets/stars.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/address/screens/addresScreens.dart';
import 'package:v1douvery/features/brands/screens/brandsScreen.dart';
import 'package:v1douvery/features/home/screens/home_screensModiles.dart';
import 'package:v1douvery/features/pruductDetails/button/buttonNoSession.dart';
import 'package:v1douvery/features/pruductDetails/services/pruductDetailsServices.dart';
import 'package:v1douvery/features/pruductDetails/widgets/modalScreen.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';
import 'package:v1douvery/models/product.dart';
import 'package:v1douvery/models/ratings.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../../../provider/theme.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = '/product-details';
  final Product product;
  ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Rating>? rating;
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  double avgRating = 0;
  double myRating = 0;
  double totalRating = 0;
  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  void addToCart() {
    productDetailsServices.addToCart(
      context: context,
      product: widget.product,
    );
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    Future _delayedFuture = Future.delayed(
      const Duration(milliseconds: 100),
      () {},
    );

    //*ModalCart

    _modalIconsCart(BuildContext context) async {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return ModalCartProductDetails();
          });
    }

    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: currentTheme.isDarkTheme()
          ? GlobalVariables.darkOFbackgroundColor
          : GlobalVariables.greyBackgroundCOlor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(105),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: Container(
            child: CustomnIconsButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 20,
              ),
              onPressed: () => Navigator.pop(
                context,
              ),
            ),
          ),
          elevation: 0,
          title: FadeInLeft(
            from: 10,
            child: const Text(
              'Volver',
            ),
          ),
          actions: [
            IconCart(),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(15),
            child: CenterSearchNav(),
          ),
          backgroundColor: Colors.blue[900],
        ),
      ),

      //SelectBody
      body: SingleChildScrollView(
        child: Column(
          children: [
            Product == null
                ? const Loader()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
                        child: Container(
                          height: 33,
                          width: MediaQuery.of(context).size.width,
                          color: currentTheme.isDarkTheme()
                              ? GlobalVariables.darkbackgroundColor
                              : GlobalVariables.backgroundColor,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (avgRating >= 5) ...[
                                            Flash(
                                                child:
                                                    Stars(rating: avgRating)),
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
                                            avgRating.toStringAsPrecision(2) +
                                            ') ' +
                                            widget.product.rating!.length
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),

                                    Text(
                                      'Precio: ',
                                      style: TextStyle(
                                          color: currentTheme.isDarkTheme()
                                              ? GlobalVariables
                                                  .text1darkbackgroundColor
                                              : Colors.black54,
                                          fontSize: 15),
                                    ),

                                    Text(
                                      '\$${widget.product.price}',
                                      style: TextStyle(
                                        color: currentTheme.isDarkTheme()
                                            ? GlobalVariables
                                                .text20darkbackgroundColor
                                            : Color(0xff1C2833),
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.4,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    //

                                    Text(
                                      'Envio Gratis',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 4, 161, 17),
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      color: currentTheme.isDarkTheme()
                          ? GlobalVariables.darkbackgroundColor
                          : GlobalVariables.backgroundColor,
                      child: CarouselSlider(
                        items: widget.product.images.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CachedNetworkImage(
                                  imageUrl: i,
                                  height: 1500,
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 400,
                          aspectRatio: 16 / 9,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                          reverse: false,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.darkbackgroundColor
                      : GlobalVariables.backgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.product.images.asMap().entries.map(
                      (entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 9.0,
                            height: 9.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Color.fromARGB(255, 68, 62, 62)
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.5 : 0.1)),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3.0, top: 5.0, right: 3.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: currentTheme.isDarkTheme()
                        ? GlobalVariables.darkbackgroundColor
                        : GlobalVariables.backgroundColor,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BrandsScreen(
                                brands: widget.product.marca,
                              ),
                              settings: RouteSettings(
                                arguments: widget.product.marca,
                              ),
                            ),
                          ),
                          child: Container(
                            height: 30,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                              top: 0,
                              left: 10,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.house_outlined,
                                      size: 16,
                                      color: currentTheme.isDarkTheme()
                                          ? Color.fromARGB(255, 5, 111, 209)
                                          : Color(0xff10375C),
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.product.marca,
                                    style: TextStyle(
                                      color: currentTheme.isDarkTheme()
                                          ? Color.fromARGB(255, 5, 111, 209)
                                          : Color(0xff10375C),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, top: 8, bottom: 15),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              widget.product.name,
                              style: GoogleFonts.roboto(
                                color: currentTheme.isDarkTheme()
                                    ? GlobalVariables.text1darkbackgroundColor
                                    : GlobalVariables.text1WhithegroundColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 00),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(0),
                    color: currentTheme.isDarkTheme()
                        ? GlobalVariables.darkbackgroundColor
                        : GlobalVariables.backgroundColor,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Provider.of<UserProvider>(context)
                                        .user
                                        .token
                                        .isNotEmpty
                                    ? ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color(0xff1a49ab), // background
                                          // foreground
                                        ),
                                        onPressed: () {
                                          addToCart();

                                          _modalIconsCart(context);
                                        },
                                        icon: Icon(IconlyLight.buy, size: 16),
                                        label: Text("Añadir al Carrito"),
                                      )
                                    : ButtomAggCartNosessions(),
                                SizedBox(width: 10),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xffed174f), // background
                                    // foreground
                                  ),
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddressScreen(
                                        totalAmount:
                                            widget.product.price.toString(),
                                        cantid: widget.product.name.toString(),
                                      ),
                                    ),
                                  ),
                                  icon: Icon(Icons.payments, size: 16),
                                  label: Text("Pagar"),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xfff1f5f9)),
                        ),
                        color: currentTheme.isDarkTheme()
                            ? GlobalVariables.darkbackgroundColor
                            : GlobalVariables.backgroundColor,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      height: 500,
                      child: ContainedTabBarView(
                        tabs: [
                          Text(
                            'Descripcion',
                            style: TextStyle(
                              color: currentTheme.isDarkTheme()
                                  ? GlobalVariables.text1darkbackgroundColor
                                  : Color.fromARGB(206, 0, 0, 0),
                            ),
                          ),
                          Text(
                            'Servicio',
                            style: TextStyle(
                              color: currentTheme.isDarkTheme()
                                  ? GlobalVariables.text1darkbackgroundColor
                                  : Color.fromARGB(206, 0, 0, 0),
                            ),
                          ),
                          Text(
                            'Reseñas',
                            style: TextStyle(
                              color: currentTheme.isDarkTheme()
                                  ? GlobalVariables.text1darkbackgroundColor
                                  : Color.fromARGB(206, 0, 0, 0),
                            ),
                          ),
                          Text(
                            'Similar',
                            style: TextStyle(
                              color: currentTheme.isDarkTheme()
                                  ? GlobalVariables.text1darkbackgroundColor
                                  : Color.fromARGB(206, 0, 0, 0),
                            ),
                          ),
                        ],
                        views: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.product.description,
                                style: TextStyle(
                                  color: currentTheme.isDarkTheme()
                                      ? GlobalVariables.text1darkbackgroundColor
                                      : GlobalVariables.text1WhithegroundColor,
                                ),
                              ),
                            ),
                          ),
                          Container(child: Text('text')),
                          Stack(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      child: Text(
                                    'Tu rating :  ',
                                    style: TextStyle(
                                        color: currentTheme.isDarkTheme()
                                            ? GlobalVariables
                                                .text1darkbackgroundColor
                                            : GlobalVariables
                                                .text1WhithegroundColor),
                                  )),
                                  Container(
                                    color: currentTheme.isDarkTheme()
                                        ? GlobalVariables.darkbackgroundColor
                                        : GlobalVariables.backgroundColor,
                                    child: RatingBar.builder(
                                      initialRating: myRating,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => Icon(
                                        Iconsax.star_15,
                                        color: Color(0xffFF2E4C),
                                      ),
                                      onRatingUpdate: (rating) {
                                        productDetailsServices.rateProduct(
                                            context: context,
                                            product: widget.product,
                                            rating: rating,
                                            comment: '');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 60.0),
                                child: Container(
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: widget.product.rating!.length,
                                      itemBuilder: ((context, index) {
                                        final rating =
                                            widget.product.rating![index];
                                        return Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                rating.userId,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: currentTheme
                                                          .isDarkTheme()
                                                      ? GlobalVariables
                                                          .text1darkbackgroundColor
                                                      : GlobalVariables
                                                          .text1WhithegroundColor,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                rating.userName,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: currentTheme
                                                          .isDarkTheme()
                                                      ? GlobalVariables
                                                          .text1darkbackgroundColor
                                                      : GlobalVariables
                                                          .text1WhithegroundColor,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              alignment: Alignment.bottomLeft,
                                              child: Row(
                                                children: [
                                                  Stars(rating: rating.rating),
                                                  Text(
                                                    '(' +
                                                        avgRating.toString() +
                                                        ') ' +
                                                        widget.product.rating!
                                                            .length
                                                            .toString(),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 13),
                                                  ),
                                                  Text(
                                                    widget.product.name.length
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      })),
                                ),
                              ),
                            ],
                          ),
                          Container(child: Text('text')),
                        ],
                        // ignore: avoid_print
                        onChange: (index) => print(index),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
