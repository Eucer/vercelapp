import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/brands/screens/brandsScreen.dart';
import 'package:v1douvery/features/cart/services/cardServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/features/pruductDetails/services/pruductDetailsServices.dart';
import 'package:v1douvery/models/product.dart';
import 'package:v1douvery/provider/user_provider.dart';

class WebFull_CartProduct extends StatefulWidget {
  final int index;
  const WebFull_CartProduct({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<WebFull_CartProduct> createState() => _WebFull_CartProductState();
}

class _WebFull_CartProductState extends State<WebFull_CartProduct> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();
  final CartServices cartServices = CartServices();

  void increaseQuantity(Product product) {
    productDetailsServices.addToCart(
      context: context,
      product: product,
    );
  }

  void decreaseQuantity(Product product) {
    cartServices.removeFromCart(
      context: context,
      product: product,
    );
  }

  void deleteAllQuantity(Product product) {
    cartServices.removeAllFromCart(
      context: context,
      product: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    final productCart = context.watch<UserProvider>().user.cart[widget.index];
    final product = Product.fromMap(productCart['product']);
    final quantity = productCart['quantity'];

    return Container(
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10),
              margin: const EdgeInsets.only(
                left: 0,
              ),
              decoration: BoxDecoration(
                  color: GlobalVariables.backgroundColor,
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(8, 0, 0, 0), width: 1))),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: product.images[0],
                    fit: BoxFit.contain,
                    height: 150,
                    width: 150,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.6,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: Text(
                          product.name,
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: Color.fromARGB(183, 33, 33, 33),
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => BrandsScreen(
                                    brands: product.marca,
                                  ),
                                  settings: RouteSettings(
                                    arguments: product.marca,
                                  ),
                                ),
                              ),
                              child: Container(
                                width: 800,
                                height: 30,
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: product.marca,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff10375C),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text(
                          'Disponible',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: GlobalVariables.colorgreen,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 15, top: 8, bottom: 8),
                        color: GlobalVariables.backgroundNavBarColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.6,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              child: Text(
                                r'$' + product.price.toString(),
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: GlobalVariables.colorPriceSecond,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black12,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black12,
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () => decreaseQuantity(product),
                                    child: Container(
                                      width: 32,
                                      height: 22,
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black12, width: 1.5),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Container(
                                      width: 25,
                                      height: 22,
                                      alignment: Alignment.center,
                                      child: Text(
                                        quantity.toString(),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => increaseQuantity(product),
                                    child: Container(
                                      width: 32,
                                      height: 22,
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black12,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black12,
                              ),
                              child: InkWell(
                                onTap: () => deleteAllQuantity(product),
                                child: Container(
                                  width: 52,
                                  height: 22,
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
