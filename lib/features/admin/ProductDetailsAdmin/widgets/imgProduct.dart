import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';

import '../../../../constantes/global_variables.dart';
import '../../../../models/product.dart';
import '../../../../provider/theme.dart';

class VendedorProductDetails extends StatefulWidget {
  final Product product;
  VendedorProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<VendedorProductDetails> createState() => _VendedorProductDetailsState();
}

class _VendedorProductDetailsState extends State<VendedorProductDetails> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          ImgDetailsAdmin(
            currentTheme: currentTheme,
            widget: widget,
            controller: _controller,
            current: _current,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: currentTheme.isDarkTheme()
                  ? GlobalVariables.borderColorsDarklv10
                  : GlobalVariables.borderColorsWhithelv10,
              height: 2,
            ),
          ),
          NombreArtAdmin(currentTheme: currentTheme, widget: widget),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: currentTheme.isDarkTheme()
                  ? GlobalVariables.borderColorsDarklv10
                  : GlobalVariables.borderColorsWhithelv10,
              height: 2,
            ),
          ),
          PrecioArtAdmin(currentTheme: currentTheme, widget: widget),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: currentTheme.isDarkTheme()
                  ? GlobalVariables.borderColorsDarklv10
                  : GlobalVariables.borderColorsWhithelv10,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class PrecioArtAdmin extends StatelessWidget {
  const PrecioArtAdmin({
    Key? key,
    required this.currentTheme,
    required this.widget,
  }) : super(key: key);

  final ThemeProvider currentTheme;
  final VendedorProductDetails widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
        width: 1,
        color: currentTheme.isDarkTheme()
            ? GlobalVariables.borderColorsDarklv10
            : GlobalVariables.borderColorsWhithelv10,
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 5,
            child: Text(
              'Precio : ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.text1darkbackgroundColor
                    : GlobalVariables.text2WhithegroundColor,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              widget.product.price.toString(),
              style: TextStyle(
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.text1darkbackgroundColor
                    : GlobalVariables.text2WhithegroundColor,
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.darkbackgroundColor),
              child: CustomnIconsButton(
                icon: Icon(Icons.edit,
                    color: currentTheme.isDarkTheme()
                        ? GlobalVariables.darkbackgroundColor
                        : GlobalVariables.backgroundColor),
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}

class NombreArtAdmin extends StatelessWidget {
  const NombreArtAdmin({
    Key? key,
    required this.currentTheme,
    required this.widget,
  }) : super(key: key);

  final ThemeProvider currentTheme;
  final VendedorProductDetails widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
        width: 1,
        color: currentTheme.isDarkTheme()
            ? GlobalVariables.borderColorsDarklv10
            : GlobalVariables.borderColorsWhithelv10,
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 5,
            child: Text(
              'Nombre : ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.text1darkbackgroundColor
                    : GlobalVariables.text2WhithegroundColor,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              widget.product.name,
              style: TextStyle(
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.text1darkbackgroundColor
                    : GlobalVariables.text2WhithegroundColor,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.darkbackgroundColor),
            child: CustomnIconsButton(
              icon: Icon(Icons.edit,
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.darkbackgroundColor
                      : GlobalVariables.backgroundColor),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class ImgDetailsAdmin extends StatelessWidget {
  const ImgDetailsAdmin({
    Key? key,
    required this.currentTheme,
    required this.widget,
    required CarouselController controller,
    required int current,
  })  : _controller = controller,
        _current = current,
        super(key: key);

  final ThemeProvider currentTheme;
  final VendedorProductDetails widget;

  final CarouselController _controller;
  final int _current;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: currentTheme.isDarkTheme()
                  ? GlobalVariables.darkbackgroundColor
                  : GlobalVariables.backgroundColor,
              child: CarouselSlider(
                items: widget.product.images.map(
                  (i) {
                    return Builder(
                      builder: (BuildContext context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          imageUrl: i,
                          height: 1500,
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),
                    );
                  },
                ).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 400,
                  aspectRatio: 16 / 9,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ],
        ),
        Container(
          color: currentTheme.isDarkTheme()
              ? GlobalVariables.darkbackgroundColor
              : GlobalVariables.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.images.asMap().entries.map(
              (entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 9.0,
                    height: 9.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 68, 62, 62)
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.5 : 0.1)),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
