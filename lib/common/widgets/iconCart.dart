import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/address/screens/addresScreens.dart';
import 'package:v1douvery/features/cart/services/cardServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/features/pruductDetails/services/pruductDetailsServices.dart';
import 'package:v1douvery/models/product.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../../features/noSessions/screens/NoSessionsUser.dart';
import '../../provider/theme.dart';

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
    final currentTheme = Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      child: Container(
        color: currentTheme.isDarkTheme()
            ? GlobalVariables.darkbackgroundColor
            : GlobalVariables.backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.darkbackgroundColor
                    : GlobalVariables.backgroundColor,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: currentTheme.isDarkTheme()
                        ? GlobalVariables.borderColorsDarklv10
                        : GlobalVariables.borderColorsWhithelv10,
                  ),
                ),
              ),
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tu carrito',
                    style: TextStyle(
                      fontSize: 20,
                      color: currentTheme.isDarkTheme()
                          ? GlobalVariables.text1darkbackgroundColor
                          : GlobalVariables.text1WhithegroundColor,
                    ),
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
                            icon: Icon(Icons.payments, size: 36),
                            label: Text(
                              "Proceder a pagar (${user.cart.length} items)",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            user.cart.length != 0
                ? Container(
                    color: currentTheme.isDarkTheme()
                        ? GlobalVariables.darkOFbackgroundColor
                        : GlobalVariables.greyBackgroundCOlor,
                    height: 350,
                    child: ListView.builder(
                      itemCount: user.cart.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: ContainerCart(
                            index: index,
                          ),
                        );
                      },
                    ),
                  )
                : NoSessionsUser()
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
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                child: Container(
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.darkbackgroundColor
                      : GlobalVariables.backgroundColor,
                  margin: const EdgeInsets.only(
                    left: 0,
                  ),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: product.images[0],
                        fit: BoxFit.contain,
                        height: 85,
                        width: 95,
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              product.name,
                              style: TextStyle(
                                fontSize: 13,
                                color: currentTheme.isDarkTheme()
                                    ? GlobalVariables.text1darkbackgroundColor
                                    : GlobalVariables.text1WhithegroundColor,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Container(
                            width: 235,
                            padding: const EdgeInsets.only(left: 0, top: 5),
                            child: Text(
                              '\$${product.price}',
                              style: TextStyle(
                                color: currentTheme.isDarkTheme()
                                    ? Color.fromARGB(255, 12, 98, 247)
                                    : GlobalVariables.colorPriceSecond,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                fontSize: 16.0,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Container(
                            width: 235,
                            padding: const EdgeInsets.only(left: 0, top: 5),
                            child: Text(
                              'Disponible',
                              style: TextStyle(
                                fontSize: 12,
                                color: currentTheme.isDarkTheme()
                                    ? GlobalVariables.text1darkbackgroundColor
                                    : Color(0xff212121),
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 15, top: 8, bottom: 8),
                            color: currentTheme.isDarkTheme()
                                ? GlobalVariables.darkbackgroundColor
                                : GlobalVariables.backgroundColor,
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
                                              color: Colors.black12,
                                              width: 1.5),
                                          color: currentTheme.isDarkTheme()
                                              ? GlobalVariables
                                                  .darkbackgroundColor
                                              : GlobalVariables.backgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        child: Container(
                                          width: 25,
                                          height: 22,
                                          alignment: Alignment.center,
                                          child: Text(
                                            quantity.toString(),
                                            style: TextStyle(
                                              color: currentTheme.isDarkTheme()
                                                  ? GlobalVariables
                                                      .text1darkbackgroundColor
                                                  : GlobalVariables
                                                      .text1WhithegroundColor,
                                            ),
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
      ),
    );
  }
}

class IconCart extends StatefulWidget {
  IconCart({Key? key}) : super(key: key);

  @override
  State<IconCart> createState() => _IconCartState();
}

class _IconCartState extends State<IconCart> {
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
        onPressed: () {
          _modalIconsCart(context);
        },
      ),
    );
  }
}
