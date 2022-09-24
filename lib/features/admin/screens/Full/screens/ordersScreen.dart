import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v1douvery/common/widgets/header_text.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/admin/screens/adminScreens.dart';
import 'package:v1douvery/features/admin/servicios/adminServices.dart';
import 'package:v1douvery/features/orderDetails/screens/orderDetails.dart';
import 'package:v1douvery/models/order.dart';

class WebFull_OrdersScreen extends StatefulWidget {
  WebFull_OrdersScreen({Key? key}) : super(key: key);

  @override
  State<WebFull_OrdersScreen> createState() => _WebFull_OrdersScreenState();
}

class _WebFull_OrdersScreenState extends State<WebFull_OrdersScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
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
                        Icon(Icons.admin_panel_settings),
                        Text(
                          'Douvery',
                          style: GoogleFonts.lato(
                            color: Color(0xffFCFCFC),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Admin',
                    style: GoogleFonts.lato(
                      color: Color(0xffFCFCFC),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              toolbarHeight: 60,
            ),
            ContainerNavOpci(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          child: orders == null
              ? Loader()
              : GridView.builder(
                  itemCount: orders!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 220,
                    mainAxisSpacing: 0.0,
                  ),
                  itemBuilder: (context, index) {
                    final orderData = orders![index];
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
                        child: Row(
                          children: [
                            SingleProduct(
                              imagen: orderData.products[0].images[0],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
