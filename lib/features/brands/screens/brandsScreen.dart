import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/common/widgets/header_double.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/common/widgets/stars.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/brands/services/marcasServices.dart';
import 'package:v1douvery/features/home/screens/home_screensModiles.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/models/product.dart';

class BrandsScreen extends StatefulWidget {
  final String brands;
  const BrandsScreen({
    Key? key,
    required this.brands,
  }) : super(key: key);

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
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
      marca: widget.brands,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(185),
          child: Center(
            child: AppBar(
              elevation: 0,
              title: Row(
                children: [
                  Text(
                    'Volver',
                    style: GoogleFonts.lato(
                        color: Color(0xffFCFCFC), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(IconlyLight.addUser),
                  onPressed: () {},
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(105),
                child: Column(
                  children: [
                    CenterSearchNav(),
                    Container(
                      width: double.infinity,
                      height: 80,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: const BoxDecoration(
                        gradient: GlobalVariables.loaderColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Center(
                                child: Text(
                                  '${widget.brands}',
                                  style: GoogleFonts.lato(
                                      fontSize: 30, color: Colors.white),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Stars(rating: 5),
                                    Text(
                                      '( 5 ) ' + '199',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            color: Colors.black12,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: GestureDetector(
                                    child: Icon(
                                      IconlyLight.heart,
                                      color: GlobalVariables.backgroundColor,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: GestureDetector(
                                    child: Icon(
                                      IconlyLight.arrowRightCircle,
                                      color: GlobalVariables.backgroundColor,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: GlobalVariables.appBarbackgroundColor,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xfff1f5f9)),
                      ),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    height: double.maxFinite,
                    child: ContainedTabBarView(
                      tabs: const [
                        Text(
                          'Productos',
                          style: TextStyle(
                            color: Color.fromARGB(206, 0, 0, 0),
                          ),
                        ),
                        Text(
                          'Reseñas',
                          style: TextStyle(
                            color: Color.fromARGB(206, 0, 0, 0),
                          ),
                        ),
                      ],
                      views: [
                        Container(
                          child: productList == null
                              ? const Loader()
                              : SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [],
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          color:
                                              GlobalVariables.backgroundColor,
                                          child: SizedBox(
                                            height: 500,
                                            width: double.infinity,
                                            child: GridView.builder(
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      crossAxisSpacing: 5,
                                                      mainAxisSpacing: 5,
                                                      mainAxisExtent: 250),
                                              itemCount: productList!.length,
                                              itemBuilder: (context, index) {
                                                final product =
                                                    productList![index];
                                                return SlideInDown(
                                                  child: GestureDetector(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 12.0),
                                                      child: Container(
                                                        width: 150,
                                                        decoration:
                                                            BoxDecoration(
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
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border(
                                                                    top:
                                                                        BorderSide(
                                                                  color: GlobalVariables
                                                                      .colorTextGreylv10,
                                                                  width: 1,
                                                                )),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              width: 200,
                                                              height: 120,
                                                              child: productList ==
                                                                      null
                                                                  ? const Loader()
                                                                  : SingleProduct(
                                                                      imagen: product
                                                                          .images[0],
                                                                    ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 10),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          5),
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    margin: EdgeInsets.only(
                                                                        bottom:
                                                                            2),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    width: double
                                                                        .infinity,
                                                                    color: Colors
                                                                        .white,
                                                                    child: Text(
                                                                      product
                                                                          .name,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xff1C2833),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        letterSpacing:
                                                                            0.4,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: EdgeInsets.only(
                                                                        bottom:
                                                                            2),
                                                                    width: double
                                                                        .infinity,
                                                                    color: Colors
                                                                        .white,
                                                                    child: Text(
                                                                      widget
                                                                          .brands,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xff1C2833),
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        letterSpacing:
                                                                            0.4,
                                                                        fontSize:
                                                                            11.0,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                    child: Text(
                                                                      '\$${product.price}',
                                                                      style:
                                                                          TextStyle(
                                                                        color: GlobalVariables
                                                                            .colorPriceSecond,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        letterSpacing:
                                                                            0.5,
                                                                        fontSize:
                                                                            14.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        Stack(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Text('Tu rating :  '),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                      // ignore: avoid_print
                      onChange: (index) => print(index),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
