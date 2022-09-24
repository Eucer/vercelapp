import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/features/admin/screens/ordersScreen.dart';
import 'package:v1douvery/models/order.dart';

import '../../../constantes/global_variables.dart';
import '../../../provider/theme.dart';

class OrdersListPreview extends StatelessWidget {
  final Order orderData;
  const OrdersListPreview({Key? key, required this.orderData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.darkbackgroundColor
                    : GlobalVariables.backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: currentTheme.isDarkTheme()
                        ? GlobalVariables.darkbackgroundColor
                        : GlobalVariables.backgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ImagesOrdersList(
                              orderData: orderData, currentTheme: currentTheme),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(left: 5.0, top: 5),
                          child: orderData.status == 4
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Container(
                                    width: 150,
                                    height: 15,
                                    child: Text(
                                      'Orden Completada',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: currentTheme.isDarkTheme()
                                            ? GlobalVariables
                                                .text1darkbackgroundColor
                                            : GlobalVariables
                                                .text1WhithegroundColor,
                                      ),
                                    ),
                                  ),
                                )
                              : Text(
                                  'Orden Pendiente',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: currentTheme.isDarkTheme()
                                        ? GlobalVariables
                                            .text1darkbackgroundColor
                                        : GlobalVariables
                                            .text1WhithegroundColor,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'Num. Orden  ',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: currentTheme.isDarkTheme()
                                      ? GlobalVariables.text1darkbackgroundColor
                                      : GlobalVariables.text1WhithegroundColor,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: currentTheme.isDarkTheme()
                                      ? GlobalVariables.darkbackgroundColor
                                      : GlobalVariables.backgroundColor,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: currentTheme.isDarkTheme()
                                          ? GlobalVariables
                                              .text1darkbackgroundColor
                                          : GlobalVariables
                                              .text1WhithegroundColor,
                                    ),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text(
                                  orderData.orderedAt.toString(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: currentTheme.isDarkTheme()
                                        ? GlobalVariables
                                            .text1darkbackgroundColor
                                        : GlobalVariables
                                            .text1WhithegroundColor,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Precio. Orden  ',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: currentTheme.isDarkTheme()
                                        ? GlobalVariables
                                            .text1darkbackgroundColor
                                        : GlobalVariables
                                            .text1WhithegroundColor,
                                  ),
                                ),
                                Text(
                                  r'$' + orderData.totalPrice.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: currentTheme.isDarkTheme()
                                        ? GlobalVariables
                                            .text1darkbackgroundColor
                                        : GlobalVariables
                                            .text2WhithegroundColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Address. Orden  ',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: currentTheme.isDarkTheme()
                                        ? GlobalVariables
                                            .text1darkbackgroundColor
                                        : GlobalVariables
                                            .text1WhithegroundColor,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height: 20,
                                  child: Text(
                                    orderData.address.toString(),
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: currentTheme.isDarkTheme()
                                          ? GlobalVariables
                                              .text1darkbackgroundColor
                                          : GlobalVariables
                                              .text1WhithegroundColor,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Status. Orden  ',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: currentTheme.isDarkTheme()
                                        ? GlobalVariables
                                            .text1darkbackgroundColor
                                        : GlobalVariables
                                            .text1WhithegroundColor,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 9,
                                  child: Text(
                                    orderData.status.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: currentTheme.isDarkTheme()
                                          ? GlobalVariables
                                              .text1darkbackgroundColor
                                          : GlobalVariables
                                              .text2WhithegroundColor,
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Product. Orden  ',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: currentTheme.isDarkTheme()
                                        ? GlobalVariables
                                            .text1darkbackgroundColor
                                        : GlobalVariables
                                            .text1WhithegroundColor,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 9,
                                  child: Text(
                                    orderData.products.length.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: currentTheme.isDarkTheme()
                                          ? GlobalVariables
                                              .text1darkbackgroundColor
                                          : GlobalVariables
                                              .text2WhithegroundColor,
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
