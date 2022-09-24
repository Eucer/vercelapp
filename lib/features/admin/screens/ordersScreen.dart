import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swipe_refresh/swipe_refresh.dart';
import 'package:v1douvery/common/widgets/header_text.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/admin/screens/adminScreens.dart';
import 'package:v1douvery/features/admin/servicios/adminServices.dart';
import 'package:v1douvery/features/orderDetails/screens/orderDetails.dart';
import 'package:v1douvery/models/order.dart';
import 'package:v1douvery/provider/ordersProviders.dart';
import 'package:v1douvery/provider/theme.dart';

import '../../Drawer/screen/mobiles_drawerScreen.dart';
import '../../search/widgets/searchignClient.dart';
import '../widgests/orders.dart';

class OrdersScreen extends StatefulWidget {
  OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();
  @override
  void initState() {
    super.initState();
    fecthOrders();
  }

  void fecthOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  final _controller = StreamController<SwipeRefreshState>.broadcast();
  Stream<SwipeRefreshState> get _stream => _controller.stream;

  @override
  Widget build(BuildContext context) {
    final orderss = context.watch<OrderProvider>().order;
    final currentTheme = Provider.of<ThemeProvider>(context);
    orderss.products.toList();

    void _reset() {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => OrdersScreen(),
        ),
      );
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(115),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Color(
                  0XFF0D3B66,
                ),
                flexibleSpace: Container(),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            'Ordenes',
                            style: GoogleFonts.lato(
                              color: Color(0xffFCFCFC),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                toolbarHeight: 60,
              ),
              Container(
                child: Column(children: [
                  SizedBox(
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      color: Color(
                        0XFF0D3B66,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Material(
                            child: TextFormField(
                              cursorColor: Colors.grey,
                              style: TextStyle(
                                color: currentTheme.isDarkTheme()
                                    ? GlobalVariables.text1darkbackgroundColor
                                    : GlobalVariables.text1WhithegroundColor,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: currentTheme.isDarkTheme()
                                    ? GlobalVariables.darkbackgroundColor
                                    : GlobalVariables.backgroundColor,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.fromLTRB(8, 5, 8, 0),
                                hintText: 'Busca tu articulo ...',
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 20,
                                  color: currentTheme.isDarkTheme()
                                      ? Colors.grey
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
        drawer: DrawerScreen(),
        body: orders == null
            ? const Loader()
            : Container(
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.darkOFbackgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                child: ListView.builder(
                  itemCount: orders!.length,
                  itemBuilder: (context, index) {
                    final orderData = orders![index];
                    return GestureDetector(
                      child: OrdersListPreview(
                        orderData: orders![index],
                      ),
                    );
                  },
                ),
              ));
  }
}

class ImagesOrdersList extends StatelessWidget {
  const ImagesOrdersList({
    Key? key,
    required this.orderData,
    required this.currentTheme,
  }) : super(key: key);

  final Order orderData;
  final ThemeProvider currentTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        orderData.products.length != 1
            ? Container(
                width: 150,
                decoration: BoxDecoration(
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.darkbackgroundColor
                      : GlobalVariables.backgroundColor,
                ),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, top: 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: CachedNetworkImage(
                            imageUrl: orderData.products[0].images[0],
                            width: 100,
                            height: 110.0,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        alignment: Alignment.center,
                        child: Text('+'),
                      )
                    ],
                  ),
                ),
              )
            : Container(
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.darkbackgroundColor
                    : GlobalVariables.backgroundColor,
                child: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0, top: 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: CachedNetworkImage(
                        imageUrl: orderData.products[0].images[0],
                        width: 150,
                        height: 110.0,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              )
      ],
    );
  }
}

class OrderSearch extends StatefulWidget {
  const OrderSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderSearch> createState() => _OrderSearchState();
}

class _OrderSearchState extends State<OrderSearch> {
  void navigateToSearchingScreen(String query) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SearchingPage(
                searchQuery: query,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      child: Column(children: [
        SizedBox(
          child: Container(
            height: 55,
            width: double.infinity,
            color: Color(
              0XFF0D3B66,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Material(
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    autofocus: true,
                    onFieldSubmitted: navigateToSearchingScreen,
                    style: TextStyle(
                      color: currentTheme.isDarkTheme()
                          ? GlobalVariables.text1darkbackgroundColor
                          : GlobalVariables.text1WhithegroundColor,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: currentTheme.isDarkTheme()
                          ? GlobalVariables.darkbackgroundColor
                          : GlobalVariables.backgroundColor,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(8, 5, 8, 0),
                      hintText: 'Busca tu articulo ...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: currentTheme.isDarkTheme()
                            ? Colors.grey
                            : Colors.grey,
                      ),
                    ),
                    onChanged: searchOrders,
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void searchOrders(String query) {}
}
