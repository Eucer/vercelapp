import 'package:flutter/material.dart';
import 'package:v1douvery/constantes/global_variables.dart';

class WebFullCategoriasUser extends StatefulWidget {
  const WebFullCategoriasUser({Key? key}) : super(key: key);

  @override
  State<WebFullCategoriasUser> createState() => _WebFullCategoriasUserState();
}

class _WebFullCategoriasUserState extends State<WebFullCategoriasUser> {
  List listCate = [
    'assets/images/gifCartShopping.png',
    'assets/images/envioShopping.png',
    'assets/images/coins.png',
    'assets/images/mail.png',
    'assets/images/chat.png',
    'assets/images/notas.png',
    'assets/images/folder.png',
    'assets/images/regalos.png',
    'assets/images/error.png',
  ];
  List listCateName = [
    'Producto',
    'Envios',
    'Generado',
    'Correo',
    'Chat',
    'Notas',
    'Carpeta',
    'Regalos',
    'Error',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: GlobalVariables.backgroundColor,
        ),
        width: 1000,
        height: 150.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listCate.length,
          itemBuilder: (BuildContext context, int index) {
            return ContainterToll(
              imagen: listCate[index],
              title: listCateName[index],
            );
          },
        ),
      ),
    );
  }
}

class ContainterToll extends StatelessWidget {
  const ContainterToll({Key? key, required this.imagen, required this.title})
      : super(key: key);
  final String imagen;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: GestureDetector(
        child: Container(
          child: Column(
            children: [
              ImagenCarouselProd(
                imagen: imagen,
              ),
              Container(
                margin: EdgeInsets.only(left: 14),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff1C2833),
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.4,
                    fontSize: 12.0,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImagenCarouselProd extends StatelessWidget {
  const ImagenCarouselProd({Key? key, required this.imagen}) : super(key: key);
  final String imagen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border:
                Border.all(color: GlobalVariables.colorTextGreylv15, width: 1),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagen),
              // picked file
              fit: BoxFit.contain,
            ),
            color: GlobalVariables.backgroundColor,
          ),
        ),
      ),
    );
  }
}
