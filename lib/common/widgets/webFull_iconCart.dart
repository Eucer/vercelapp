import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/address/screens/addresScreens.dart';
import 'package:v1douvery/features/cart/screens/webFull_CartScreen.dart';
import 'package:v1douvery/features/cart/services/cardServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/features/pruductDetails/services/pruductDetailsServices.dart';
import 'package:v1douvery/models/product.dart';
import 'package:v1douvery/provider/user_provider.dart';

class ModalIcons extends StatefulWidget {
  ModalIcons({Key? key}) : super(key: key);

  @override
  State<ModalIcons> createState() => _ModalIconsState();
}

class _ModalIconsState extends State<ModalIcons> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: GlobalVariables.backgroundColor,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color.fromARGB(
                      10,
                      0,
                      0,
                      0,
                    ),
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width / 1.4,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Web Tu carrito',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                            autofocus: false,
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffed174f), // background
                              // foreground
                            ),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddressScreen(
                                  totalAmount: sum.toString(),
                                  cantid: user.cart.length.toString(),
                                ),
                              ),
                            ),
                            icon: Icon(
                              Icons.payments,
                              size: 36,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Proceder a pagar (${user.cart.length} items)",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: GlobalVariables.backgroundColor,
              height: 1000,
              child: ListView.builder(
                itemCount: user.cart.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ContainerCart(
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerCart extends StatefulWidget {
  final int index;
  ContainerCart({Key? key, required this.index}) : super(key: key);

  @override
  State<ContainerCart> createState() => _ContainerCartState();
}

class _ContainerCartState extends State<ContainerCart> {
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

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    final productCart = context.watch<UserProvider>().user.cart[widget.index];
    final product = Product.fromMap(productCart['product']);
    final quantity = productCart['quantity'];

    return Padding(
      padding: const EdgeInsets.only(left: 300.0, right: 300),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: GlobalVariables.backgroundColor,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color.fromARGB(
                        10,
                        0,
                        0,
                        0,
                      ),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: product.images[0],
                      fit: BoxFit.contain,
                      height: 155,
                      width: 455,
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.8,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          padding: const EdgeInsets.only(left: 0, top: 5),
                          child: Text(
                            '\$${product.price}',
                            style: const TextStyle(
                              color: GlobalVariables.colorPriceSecond,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                              fontSize: 16.0,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          padding: const EdgeInsets.only(left: 0, top: 5),
                          child: const Text(
                            'Disponible',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff212121),
                            ),
                            maxLines: 2,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15, top: 8, bottom: 8),
                          color: GlobalVariables.backgroundNavBarColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                        width: 30,
                                        height: 22,
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.remove,
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
                                        width: 30,
                                        height: 22,
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.add,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ],
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
      ),
    );
  }
}

class WebFull_IconCart extends StatefulWidget {
  WebFull_IconCart({Key? key}) : super(key: key);

  @override
  State<WebFull_IconCart> createState() => _WebFull_IconCartState();
}

class _WebFull_IconCartState extends State<WebFull_IconCart> {
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

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    _modalIconsCart(BuildContext context) async {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return ModalIcons();
          });
    }

    return Badge(
      toAnimate: false,
      position: BadgePosition.topEnd(top: 2, end: 3),
      animationDuration: Duration(milliseconds: 300),
      badgeColor: Color(0xffe84118),
      badgeContent: Text(
        userCartLen.toString(),
        style: TextStyle(color: Colors.white, fontSize: 11),
      ),
      child: IconButton(
        enableFeedback: false,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: const Icon(IconlyLight.buy, color: Colors.white),
        onPressed: () => Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => WebFull_CartScreen(),
          ),
        ),
      ),
    );
  }
}
