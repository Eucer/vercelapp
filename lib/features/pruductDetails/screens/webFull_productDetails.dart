import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modals/modals.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/web/Web_appBarIcons.dart';
import 'package:v1douvery/NAV/web/Web_bottomNavSearchTitle.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/common/widgets/custom_textfiels.dart';
import 'package:v1douvery/common/widgets/stars.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/address/screens/addresScreens.dart';
import 'package:v1douvery/features/brands/screens/brandsScreen.dart';
import 'package:v1douvery/features/home/screens/home_screensModiles.dart';
import 'package:v1douvery/features/orderDetails/screens/orderDetails.dart';
import 'package:v1douvery/features/pruductDetails/button/buttonNoSession.dart';
import 'package:v1douvery/features/pruductDetails/services/pruductDetailsServices.dart';
import 'package:v1douvery/features/pruductDetails/widgets/modalScreen.dart';
import 'package:v1douvery/models/ratings.dart';
import 'package:v1douvery/models/user.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../../../common/widgets/loader.dart';
import '../../../models/product.dart';
import '../../auth/responsive/authResponsivelayout.dart';

class WebFull_productDetails extends StatefulWidget {
  final Product product;
  WebFull_productDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<WebFull_productDetails> createState() => _WebFull_productDetailsState();
}

class _WebFull_productDetailsState extends State<WebFull_productDetails> {
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

    final TextEditingController reviewClient = TextEditingController();
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: Center(
          child: Web_AppBarIcons(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Product == null
                ? const Loader()
                : Column(children: [
                    WebFull_NavCategory(),
                    ConPricer(context),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                              color: Colors.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Carousel(context),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.8,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () => Navigator.push(
                                                      context,
                                                      PageRouteBuilder(
                                                        pageBuilder:
                                                            (_, __, ___) =>
                                                                BrandsScreen(
                                                          brands: widget
                                                              .product.marca,
                                                        ),
                                                        settings: RouteSettings(
                                                          arguments: widget
                                                              .product.marca,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      width: 660,
                                                      height: 30,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            WidgetSpan(
                                                              child: Icon(
                                                                Icons
                                                                    .house_outlined,
                                                                size: 16,
                                                                color: Color(
                                                                    0xff10375C),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: widget
                                                                  .product
                                                                  .marca,
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff10375C),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: 660,
                                                              height: 80,
                                                              child: Text(
                                                                widget.product
                                                                    .name,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Color(
                                                                      0xff1C2833),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  letterSpacing:
                                                                      0.4,
                                                                  fontSize:
                                                                      20.0,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 3,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border(
                                                                            bottom:
                                                                                BorderSide(width: 1, color: Color(0xfff1f5f9)),
                                                                          ),
                                                                          color:
                                                                              GlobalVariables.backgroundColor,
                                                                        ),
                                                                        width:
                                                                            600,
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        height:
                                                                            1000,
                                                                        child:
                                                                            ContainedTabBarView(
                                                                          tabBarProperties:
                                                                              const TabBarProperties(
                                                                            indicatorColor:
                                                                                Colors.red,
                                                                          ),
                                                                          tabs: const [
                                                                            Text(
                                                                              'Descripcion',
                                                                              style: TextStyle(
                                                                                color: Color.fromARGB(206, 0, 0, 0),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'Servicio',
                                                                              style: TextStyle(
                                                                                color: Color.fromARGB(206, 0, 0, 0),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                          views: [
                                                                            ContainerDescription(),
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                border: Border.all(
                                                                                  width: 1,
                                                                                  color: Color.fromARGB(31, 166, 176, 195),
                                                                                ),
                                                                                color: Color(0XFFeee),
                                                                              ),
                                                                              width: 600,
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              height: 860,
                                                                              child: ContainedTabBarView(
                                                                                tabBarProperties: TabBarProperties(
                                                                                  indicatorWeight: 1.0,
                                                                                  indicatorColor: Provider.of<UserProvider>(context).user.token.isNotEmpty ? Color.fromARGB(88, 221, 221, 221) : GlobalVariables.colorgreen,
                                                                                ),
                                                                                tabs: const [
                                                                                  Text(
                                                                                    'Reviews',
                                                                                    style: TextStyle(
                                                                                      color: Color.fromARGB(206, 0, 0, 0),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                                views: [
                                                                                  Column(
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 600,
                                                                                        child: StackReviews(context),
                                                                                      ),
                                                                                      ContaienrBoxStarsEndCoemnd(context, user, reviewClient),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                                // ignore: avoid_print
                                                                                onChange: (index) => print(index),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                          // ignore: avoid_print
                                                                          onChange: (index) =>
                                                                              print(index),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ]),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ]),
          ]),
        ),
      ),
    );
  }

  Container ContaienrBoxStarsEndCoemnd(
      BuildContext context, User user, TextEditingController reviewClient) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Color.fromARGB(88, 221, 221, 221),
          ),
        ),
        color: Color.fromARGB(20, 221, 221, 221),
      ),
      child: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      width: 500,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10, right: 10),
                            child: Text(
                              user.name,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          RatingBar.builder(
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
                                comment: reviewClient.text,
                                rating: rating,
                              );
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3.5,
                              height: 100,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    height: 100,
                                    child: CustomTextField(
                                      controller: reviewClient,
                                      hintText: '',
                                      maxLines: 4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomnIconsButton(
                                  onPressed: () {},
                                  icon: Icon(IconlyLight.infoSquare)),
                              Text(
                                'Porfavor introduce tu mas sicera opinion.',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(
                                      183,
                                      33,
                                      33,
                                      33,
                                    )),
                              ),
                            ],
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary:
                                  GlobalVariables.secondaryColor, // background
                              // foreground
                            ),
                            onPressed: () {
                              productDetailsServices.rateProduct(
                                context: context,
                                product: widget.product,
                                comment: reviewClient.text,
                                rating: totalRating,
                              );
                              setState(() {});
                            },
                            icon: Icon(
                              IconlyLight.send,
                              size: 25,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Crear opinion",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color.fromARGB(5, 0, 0, 0),
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Inicia session para comentar ...  ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => WebFullResponsiveLayaout(),
                          ),
                        );
                      },
                      child: const Text(
                        'Iniciar Session',
                        style: TextStyle(color: GlobalVariables.colorgreen),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Container ContainerDescription() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.product.description,
        ),
      ),
    );
  }

  Stack StackReviews(BuildContext context) {
    final TextEditingController reviewClient = TextEditingController();
    final user = Provider.of<UserProvider>(context).user;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Container(
            margin: Provider.of<UserProvider>(context).user.token.isNotEmpty
                ? EdgeInsets.only(top: 0.0)
                : EdgeInsets.only(top: 000.0),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.product.rating!.length,
                itemBuilder: ((context, index) {
                  final rating = widget.product.rating![index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 1,
                            color: Color.fromARGB(88, 221, 221, 221),
                          ),
                        ),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/user.jpg"),
                                          // picked file
                                          fit: BoxFit.cover,
                                        ),
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text(
                                      rating.userName == ''
                                          ? 'Nombre no disponible'
                                          : rating.userName,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            GlobalVariables.colorTextBlckBold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomnIconsButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconlyLight.shieldDone,
                                  size: 15,
                                  color: GlobalVariables.colorgreen,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //! Importante cuando se pueda agreagr imagen a
                                    //! los comentarios.

                                    //  Container(
                                    //   margin: EdgeInsets.only(right: 5),
                                    //   width:
                                    //      MediaQuery.of(context).size.width / 3,
                                    //  height: 100,
                                    //   child: Row(
                                    //    children: [
                                    //      Image(
                                    //        image: AssetImage(""),
                                    ////      ),
                                    //     Image(
                                    //      image: AssetImage(""),
                                    //    ),
                                    //    Image(
                                    //      image: AssetImage(""),
                                    //      ),
                                    //    ],
                                    //   ),
                                    //  ),
                                  ],
                                ),
                                Text(
                                  rating.userComment == ''
                                      ? 'Comentario no disponible'
                                      : rating.userComment,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromARGB(
                                        183,
                                        33,
                                        33,
                                        33,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Stars(rating: rating.rating),
                                    Text(
                                      '(' +
                                          rating.rating.toStringAsPrecision(2) +
                                          ') ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomnIconsButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.thumb_up_off_alt,
                                  size: 15,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              CustomnIconsButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.thumb_down_off_alt,
                                  size: 15,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })),
          ),
        ),
      ],
    );
  }

  Padding Carousel(BuildContext context) {
    final TextEditingController reviewClient = TextEditingController();
    final user = Provider.of<UserProvider>(context).user;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: 800,
              decoration: const BoxDecoration(
                color: GlobalVariables.backgroundColor,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color.fromARGB(5, 0, 0, 0),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HoverWidget(
                    hoverChild: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_left,
                            color: GlobalVariables.secondaryColor,
                          ),
                          Text(
                            'Regresar',
                            style: GoogleFonts.openSans(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    onHover: (PointerEnterEvent event) {},
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_left),
                          Text(
                            'Regresar',
                            style: GoogleFonts.openSans(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 30),
              width: 800,
              height: 1500,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 700,
                                  height: 600,
                                  decoration: BoxDecoration(
                                    color: GlobalVariables.greyBackgroundCOlor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: CarouselSlider(
                                    items: widget.product.images.map(
                                      (i) {
                                        return Builder(
                                          builder: (BuildContext context) =>
                                              Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: GlobalVariables
                                                    .backgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl: i,
                                                height: 1500,
                                                fit: BoxFit.contain,
                                                width: 700,
                                                placeholder: (context, url) =>
                                                    Loader(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                    options: CarouselOptions(
                                      viewportFraction: 1,
                                      height: 600,
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
                          ],
                        ),
                        Container(
                          color: GlobalVariables.backgroundColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: widget.product.images.asMap().entries.map(
                              (entry) {
                                return GestureDetector(
                                  onTap: () =>
                                      _controller.animateToPage(entry.key),
                                  child: Container(
                                    width: 9.0,
                                    height: 9.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 4.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? Color.fromARGB(
                                                    255, 68, 62, 62)
                                                : Colors.black)
                                            .withOpacity(_current == entry.key
                                                ? 0.5
                                                : 0.1)),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container ConPricer(BuildContext context) {
    _modalIconsCart(BuildContext context) async {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return ModalCartProductDetails();
          });
    }

    return Container(
      height: 53,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (avgRating >= 5) ...[
                    Flash(child: Stars(rating: avgRating)),
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
                    widget.product.rating!.length.toString(),
                style: const TextStyle(color: Colors.grey, fontSize: 15),
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 18),
            const Text(
              'Precio: ',
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),

            Text(
              '\$${widget.product.price}',
              style: const TextStyle(
                color: Color(0xff1C2833),
                fontWeight: FontWeight.w500,
                letterSpacing: 0.4,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(width: 18),
            //

            const Text(
              'Envio Gratis',
              style: TextStyle(
                  color: Color.fromARGB(255, 4, 161, 17), fontSize: 15),
            ),

            Container(
              height: 60,
              width: 300,
              padding: EdgeInsets.all(0),
              color: Colors.white,
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
                              ? ButtomAggCartSessions(_modalIconsCart, context)
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
                                  totalAmount: widget.product.price.toString(),
                                  cantid: widget.product.name.toString(),
                                ),
                              ),
                            ),
                            icon: Icon(
                              Icons.payments,
                              size: 16,
                              color: Colors.white,
                            ),
                            label: Text("Pagar",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ]),
    );
  }

  ElevatedButton ButtomAggCartSessions(
      Future<Null> _modalIconsCart(BuildContext context),
      BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Color(0xff1a49ab), // background
        // foreground
      ),
      onPressed: () {
        addToCart();
        ElegantNotification.success(
            showProgressIndicator: true,
            width: MediaQuery.of(context).size.width / 1,
            title: Text("Agregado"),
            description: Text("Tu carrito se actualizo correctamente"));
      },
      icon: Icon(
        IconlyLight.buy,
        size: 16,
        color: Colors.white,
      ),
      label: Text(
        "Añadir al Carrito",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
