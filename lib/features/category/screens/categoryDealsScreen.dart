import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/mobiles/bottomNavSearchTitle.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/NAV/mobiles/topTitleButtom.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/common/widgets/header_double.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/common/widgets/stars.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/home/screens/home_screensModiles.dart';

import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/models/product.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../services/categoryServices.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Product>? productList;
  final CategoryServices homeServices = CategoryServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(105),
        child: TopTitleButtom(
          title: 'Volver',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xfff9f9f9),
              child: Column(
                children: [
                  NavCategory(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff05595B)),
                      alignment: Alignment.center,
                      child: Text(
                        '${widget.category}',
                        style: TextStyle(
                            fontSize: 17,
                            color: GlobalVariables.colorTextWhiteLight),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          color: Colors.white,
                          child: headerDoubleText(
                            textHeader: 'Productos en  ${widget.category}',
                            textAction: '',
                          ),
                        ),
                        productList == null
                            ? const Loader()
                            : CategoriNamed(productList: productList),
                      ],
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

class CategoriNamed extends StatelessWidget {
  CategoriNamed({
    Key? key,
    required this.productList,
  }) : super(key: key);

  final List<Product>? productList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff9f9f9),
      child: SizedBox(
        height: 500,
        width: double.infinity,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              mainAxisExtent: MediaQuery.of(context).size.width / 1.8),
          itemCount: productList!.length,
          scrollDirection: Axis.vertical,
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
                decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(
                    color: Color.fromARGB(1, 0, 0, 0),
                    width: 1,
                  )),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                          color: Color.fromARGB(1, 0, 0, 0),
                          width: 1,
                        )),
                        color: Colors.white,
                      ),
                      width: 200,
                      height: 130,
                      child: productList == null
                          ? const Loader()
                          : Container(
                              color: Colors.white,
                              child: CarouselSlider(
                                items: product.images.map(
                                  (i) {
                                    return Builder(
                                      builder: (BuildContext context) =>
                                          Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CachedNetworkImage(
                                          imageUrl: i,
                                          height: 250,
                                          fit: BoxFit.contain,
                                          width: 100,
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                                options: CarouselOptions(
                                  viewportFraction: 1,
                                  height: 500,
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
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, top: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            alignment: Alignment.bottomLeft,
                            width: double.infinity,
                            color: Colors.white,
                            child: Text(
                              product.name,
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                color: Color(0xff212121),
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            width: double.infinity,
                            color: Colors.white,
                            child: Text(
                              product.marca,
                              style: GoogleFonts.roboto(
                                color: Color(0xff383838),
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.4,
                                fontSize: 11.0,
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            width: double.infinity,
                            child: Stars(rating: avgRating),
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              '\$${product.price}',
                              style: const TextStyle(
                                color: GlobalVariables.colorPriceSecond,
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
    );
  }
}
