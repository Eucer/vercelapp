import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/constantes/global_variables.dart';

import '../../../provider/theme.dart';

class CategoriasUser extends StatefulWidget {
  const CategoriasUser({Key? key}) : super(key: key);

  @override
  State<CategoriasUser> createState() => _CategoriasUserState();
}

class _CategoriasUserState extends State<CategoriasUser> {
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
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      color: currentTheme.isDarkTheme()
          ? GlobalVariables.darkbackgroundColor
          : Color.fromARGB(255, 254, 255, 255),
      height: 120.0,
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
    final currentTheme = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          width: 80,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.borderColorsDarklv10
                    : GlobalVariables.borderColorsWhithelv10,
                width: 1),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagen),
              // picked file
              fit: BoxFit.contain,
            ),
            color: currentTheme.isDarkTheme()
                ? GlobalVariables.darkOFbackgroundColor
                : GlobalVariables.backgroundColor,
          ),
        ),
      ),
    );
  }
}
