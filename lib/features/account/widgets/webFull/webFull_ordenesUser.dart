import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:v1douvery/common/widgets/header_double.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/services/accountServices.dart';
import 'package:v1douvery/features/orderDetails/screens/orderDetails.dart';
import 'package:v1douvery/features/orderDetails/screens/webFull_orderDetails.dart';
import 'package:v1douvery/models/order.dart';

class WebFullOrdersUser extends StatefulWidget {
  const WebFullOrdersUser({Key? key}) : super(key: key);

  @override
  State<WebFullOrdersUser> createState() => _WebFullOrdersUserState();
}

class _WebFullOrdersUserState extends State<WebFullOrdersUser> {
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            color: Colors.white,
            child: headerDoubleText(
              textHeader: 'Orders',
              textAction: 'Ver mas',
            ),
          ),
          orders == ''
              ? Container(
                  child: Text('NADA'),
                )
              : orders == null
                  ? const Loader()
                  : Container(
                      height: 550,
                      padding: EdgeInsets.only(left: 50, right: 0),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: orders!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderDetailScreen(
                                  order: orders![index],
                                ),
                                settings: RouteSettings(
                                  arguments: orders![index],
                                ),
                              ),
                            ),
                            child: Container(
                              width: 800,
                              height: 200,
                              child: Row(
                                children: [
                                  SingleProduct(
                                    imagen:
                                        orders![index].products[0].images[0],
                                  ),
                                  Container(
                                    width: 700,
                                    height: 150,
                                    child: WebFullOrderDetailScreen(
                                      order: orders![index],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
        ],
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final String imagen;
  const SingleProduct({Key? key, required this.imagen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalVariables.backgroundColor,
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(left: 0.0, top: 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: CachedNetworkImage(
              imageUrl: imagen,
              width: 150,
              height: 110.0,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
