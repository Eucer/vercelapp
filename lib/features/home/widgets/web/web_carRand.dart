import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v1douvery/common/widgets/header_double.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/models/product.dart';

class Web_CarRandom extends StatefulWidget {
  const Web_CarRandom({Key? key}) : super(key: key);

  @override
  State<Web_CarRandom> createState() => _Web_CarRandomState();
}

class _Web_CarRandomState extends State<Web_CarRandom> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchTest();
  }

  fetchTest() async {
    productList = await homeServices.fetchTest(
      context: context,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final CarouselController _controller = CarouselController();

    @override
    void initState() {
      super.initState();
    }

    return Container(
      width: MediaQuery.of(context).size.width / 1.6,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: Color.fromARGB(12, 0, 0, 0)))),
            child: headerDoubleText(
              textHeader: 'Historial Click',
              textAction: 'Ver mas',
            ),
          ),
          productList == null
              ? const Loader()
              : Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  width: 1000,
                  color: GlobalVariables.backgroundColor,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                            height: 105,
                            width: 1000,
                            child: CarouselSlider.builder(
                              itemCount: productList!.length,
                              itemBuilder: (context, index, realIndex) {
                                final product = productList![index];
                                return Container(
                                  width: 100,
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailsScreen(
                                          product: product,
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      width: 105.0,
                                      height: 80.0,
                                      child: productList == null
                                          ? const Loader()
                                          : Container(
                                              width: 200,
                                              child: CachedNetworkImage(
                                                imageUrl: product.images[0],
                                              )),
                                    ),
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                enableInfiniteScroll: false,
                                viewportFraction: 0.2,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.height,
                                aspectRatio: 1 / 2,
                                disableCenter: true,
                                pageSnapping: false,
                                padEnds: false,
                                pauseAutoPlayOnTouch: false,
                              ),
                              carouselController: _controller,
                            )),
                      ),
                      Center(
                        child: Positioned(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                child: ElevatedButton(
                                  onPressed: () => _controller.previousPage(),
                                  child: Text('←'),
                                ),
                              ),
                              Flexible(
                                child: ElevatedButton(
                                  onPressed: () => _controller.nextPage(),
                                  child: Text('→'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
