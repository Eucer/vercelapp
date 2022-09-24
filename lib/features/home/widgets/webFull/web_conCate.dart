import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:v1douvery/common/widgets/header_double.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/features/pruductDetails/screens/webFull_productDetails.dart';
import 'package:v1douvery/models/product.dart';

class WebFull_conCategory extends StatelessWidget {
  const WebFull_conCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        padding: const EdgeInsets.only(left: 20.0),
        color: Colors.white,
        width: 1260,
        height: 400,
        child: Row(
          children: [
            Web_brands1(category: 'Mobiles'),
            Web_brands1(category: 'Books'),
            Web_brands1(category: 'Electronics'),
          ],
        ),
      ),
    );
  }
}

class Web_brands1 extends StatefulWidget {
  final String category;
  const Web_brands1({Key? key, required this.category}) : super(key: key);

  @override
  State<Web_brands1> createState() => _Web_brands1State();
}

class _Web_brands1State extends State<Web_brands1> {
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
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return productList == null
        ? const Loader()
        : Container(
            margin: EdgeInsets.only(right: 10),
            color: Colors.white,
            width: 400,
            height: 353,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
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
                    textHeader: widget.category,
                    textAction: 'Ver mas',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  color: Color(0XFFF8F9F9),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 2,
                          mainAxisExtent: 200),
                      itemCount: productList!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
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
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: CachedNetworkImage(
                              fit: BoxFit.contain,
                              imageUrl: product.images[0],
                            ),
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
