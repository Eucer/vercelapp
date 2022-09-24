import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:v1douvery/common/widgets/header_double.dart';
import 'package:v1douvery/common/widgets/header_text.dart';

class RecomendForYou extends StatefulWidget {
  const RecomendForYou({Key? key}) : super(key: key);

  @override
  State<RecomendForYou> createState() => _RecomendForYouState();
}

class _RecomendForYouState extends State<RecomendForYou> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: headerDoubleText(
                    textHeader: 'Puede que te interese', textAction: 'Ver mas'),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: populares(
                  image: const NetworkImage(
                      'https://images.unsplash.com/photo-1605588818931-cd8f98b65d78?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880'),
                  title: "Algodón De Ganchillo",
                  envio: "Envio Gratis",
                  precio: "\$150.00",
                  recomed: "Para ti",
                  review: "15",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: populares(
                  image: const NetworkImage(
                      'https://m.media-amazon.com/images/I/71bhWgQK-cL._AC_SX466_.jpg'),
                  title: "Apple AirPods Pro",
                  envio: "Envio Gratis",
                  precio: "\$122.14",
                  recomed: "Para ti",
                  review: "10",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget populares({
  BuildContext? context,
  double marginTop = 0.0,
  double marginRight = 8.0,
  double marginBottom = 0.0,
  double marginLeft = 10.0,
  required ImageProvider<Object> image,
  required String title,
  required String envio,
  required String precio,
  required String recomed,
  required String review,
}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(
            top: marginTop,
            right: marginRight,
            bottom: marginBottom,
            left: marginLeft),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image(
                    width: 80, height: 80, fit: BoxFit.cover, image: image),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    child: headerText(
                        texto: title,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 17.0),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star,
                          color: Color.fromARGB(255, 207, 101, 14), size: 16),
                      Text(
                        '(' + review + ') ' + 'personas le ha gustado',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        width: 50.0,
                        height: 20.0,
                        color: const Color(0xffC70039),
                        child: Text(
                          recomed,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          envio,
                          style: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 4, 161, 17),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.0),
                        child: Text(
                          precio,
                          style: GoogleFonts.roboto(
                            color: Color(0xff1C2833),
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.4,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ) // ClipRRect
          ],
        ),
      )
    ], // Row
  );
}// Column